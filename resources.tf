// web-server
resource "aws_instance" "web-server" {
  count                  = length(var.web_server_az)
  ami                    = var.web_server_instance_ami
  instance_type          = var.web_server_instance_type
  key_name               = var.web_server_key_name
  vpc_security_group_ids = [aws_security_group.sg.id]
  availability_zone      = var.web_server_az[count.index]
  user_data              = <<EOF
#!/bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
chkconfig httpd on
echo "hai all this is my app created by terraform infrastructurte by raham sir server-1" > /var/www/html/index.html
EOF
  tags = {
    Name = var.web_server_instance_name[count.index]
  }
}


// app server 
resource "aws_instance" "app-server" {
  count                  = length(var.app_server_az)
  ami                    = var.app_server_instance_ami
  instance_type          = var.app_server_instance_type
  key_name               = var.app_server_key_name
  vpc_security_group_ids = [aws_security_group.sg.id]
  availability_zone      = var.app_server_az[count.index]
  tags = {
    Name = var.app_server_instance_name[count.index]
  }
}



// security group
locals {
  ingress_rules = [{
    port        = 22
    description = "Ingress rules for ssh"
    },
    {
      port        = 80
      description = "Ingress rules for http"
  }]
}

resource "aws_security_group" "sg" {
  name = "terra-sg"

  dynamic "ingress" {
    for_each = local.ingress_rules
    content {
      description = "*"
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress = [
    {
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "*"
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
  }]
}



// s3 Bucket
resource "aws_s3_bucket" "s3" {
  bucket = "niteshbucket123456789"
}


// Iam user
resource "aws_iam_user" "iam" {
  for_each = var.user_names
  name     = each.value
}


// Ebs volume
resource "aws_ebs_volume" "ebs" {
  availability_zone = "us-west-1a"
  size              = var.ebs_size
  tags = {
    Name = "ebs-001"
  }
}