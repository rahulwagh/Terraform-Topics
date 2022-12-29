provider "aws" {
  region     = var.location
  access_key = "<INSERT_YOU_ACCESS_KEY>"
  secret_key = "<INSERT_YOU_SECRET_KEY>"
}

resource "aws_instance" "ec2_example" {

  ami           = "ami-0767046d1677be5a0"
  instance_type =  var.instance_type

  tags = {
    Name = var.tag
  }
}