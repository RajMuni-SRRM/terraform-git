/*
terraform {
  backend "s3" {
    bucket = "srrm-s3-terraform-demo"
    key    = "terraform-demo-mar-2022/mar-2022"
    region = "eu-west-2"
  }
}

*/
provider "aws" {
    region = "${var.region}"
}

resource "aws_instance" "k8s" {
    count         = "${var.instance_count}"
    ami           = "${var.ami}"
    instance_type = "${var.instance_type}"
    key_name = "${var.key_name}"
    vpc_security_group_ids = "${var.security_group}"
    tags = {
        Name = "Node-${count.index}"
    }
}

output "public_ip" {
  value = aws_instance.k8s[*].public_ip
}

