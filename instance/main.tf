terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.17.1"
    }
  }
}
provider "aws" {
	region = "us-east-1"
  access_key = var.my_access_key
	secret_key = var.my_secret_key
}
resource "aws_instance" "example" {
	ami = var.ami_id
	instance_type = var.instance_type
  tags = var.tags

  security_groups = ["${aws_security_group.ssh_connection.name}"]
}

resource "aws_security_group" "ssh_connection" {
  name        = var.sg_name

  ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocol
    cidr_blocks      = var.cidr_blocks
  }

}



