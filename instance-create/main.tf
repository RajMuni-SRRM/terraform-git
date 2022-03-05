
terraform {
  backend "s3" {
    bucket = "srrm-s3-terraform-demo"
    key    = "terraform-demo-mar-2022/mar-2022"
    region = "eu-west-2"
  }
}


provider "aws" {
    region = "eu-west-2"
}

resource "aws_instance" "k8s" {
    count         = 2
    ami           = "ami-0015a39e4b7c0966f"
    instance_type = var.instance_type
    key_name = "common-key-pair"
    vpc_security_group_ids = ["sg-062b7c758e483c1ff"]
    tags = {
        Name = "Node-${count.index}"
    }
}

output "public_ip" {
  value = aws_instance.k8s[*].public_ip
}

