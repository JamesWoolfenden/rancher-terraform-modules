name = "k8s-ha-demo"

vpc_id = "<vpcid>"

ipsec_node_cidrs = ["0.0.0.0/0"]

ssh_key_name = "<ssh-key-name>"

subnet_ids = ["subnet-<id>"]

subnet_cidrs = ["<cidr for subnets>"]

aws_instance_type = "t2.medium"

cattle_agent_ip = "local-ipv4"

project_template_id = "1pt6"

rancher_api_url = ""
aws_region      = "eu-west-1"
common_tags = {
  "createdby" = "terraform"
}
