// variable for web-server
variable "web_server_instance_type" {
  type        = string
  description = "*"
}
variable "web_server_instance_ami" {
  type        = string
  description = "*"
}
variable "web_server_az" {

}
variable "web_server_instance_name" {

}
variable "web_server_key_name" {
  type        = string
  description = "*"
}


// variable for app-server
variable "app_server_instance_type" {
  type        = string
  description = "*"
}

variable "app_server_instance_ami" {
  type        = string
  description = "*"
}

variable "app_server_az" {

}

variable "app_server_instance_name" {

}

variable "app_server_key_name" {
  type        = string
  description = "*"
}




// for iam user
variable "user_names" {
  type = set(string)

}


// for Ebs Volume 
variable "ebs_size" {
  description = ""
  type        = number
}


