provider "aws" {
  region                   = "eu-central-1"
  shared_credentials_files = ["/Users/rahulwagh/.aws/credentials"]
}

locals {
  instance_name = "${terraform.workspace}-instance" 
}

resource "aws_instance" "ec2_example" {

    ami = "ami-0767046d1677be5a0" 

    instance_type = var.instance_type

    tags = {
      Name = local.instance_name
    }
}