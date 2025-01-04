
// for web-server
web_server_instance_type = "t2.micro"
web_server_instance_name = ["Web-Server-1", "Web-Server-2"]
web_server_instance_ami  = "ami-0aa117785d1c1bfe5"
web_server_az            = ["us-west-1a","us-west-1c"]
web_server_key_name      = "terraform"


// for app-server
app_server_instance_type = "t2.micro"
app_server_instance_name = ["app-Server-1", "app-Server-2"]
app_server_instance_ami  = "ami-0aa117785d1c1bfe5"
app_server_az            = ["us-west-1a","us-west-1c"]
app_server_key_name      = "terraform"

// for iam-user
user_names = ["user1", "user2", "user3", "user4"]


//for Ebs Volume 
ebs_size = 20 
