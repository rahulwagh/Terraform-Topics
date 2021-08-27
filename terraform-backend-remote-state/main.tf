provider "aws" {
   region     = "eu-central-1"
   access_key = "AKIATQ37NXB2D5QP5CX5"
   secret_key = "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"
}

terraform {
    backend "s3" {
        bucket = "jhooq-terraform-s3-bucket"
        key    = "jhooq/terraform/remote/s3/terraform.tfstate"
        region     = "eu-central-1"
        #access_key = "AKIATQ37NXB2D5QP5CX5"
        #secret_key = "2UIkrvEaXCv3m3fqrJQiNhwGUMOkb6wLiXpSmwN4"
    }
}


resource "aws_instance" "ec2_example" {

    ami = "ami-0767046d1677be5a0" 

    instance_type = "t2.micro"

    tags = {
      Name = "EC2 Instance with remote state"
    }
}