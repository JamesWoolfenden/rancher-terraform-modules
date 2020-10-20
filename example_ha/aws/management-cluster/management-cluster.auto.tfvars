rancher_version = "rancher/server:latest"

aws_ami_id        = "ami-10381d70"
vpc_id            = ""
aws_instance_type = "t2.medium"
aws_region        = "eu-west-2"
spot_enabled      = "true"

aws_env_name        = "production"
public_subnet_cidrs = ["10.0.0.0/16"]
api_ui_version      = "1.5.8"
public_subnet_ids   = ["10.0.0.0/16"]
rancher_hostname    = "myrancher"
rancher_com_arn     = ""
domain_name         = "example.com"
sysdig_key          = ""
common_tags = {
"createdby" = "terraform" }
username          = ""
password          = ""
database_endpoint = ""
database          = ""
