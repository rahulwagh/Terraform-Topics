provider "aws" {
   region     = "eu-central-1"
   access_key = "AKIATQ37NXB2CXGIKE67"
   secret_key = "laB0m5+mmm+g+Ac5uCHLYW1EysU2JyaM7vrIDJ2j"
}

resource "aws_instance" "ec2_example" {

   ami           = "ami-0767046d1677be5a0"
   instance_type =  "t2.micro"

   tags = {
           Name = "Terraform EC2"
   }
}

output "my_console_output" {
   value = "Hello this is sensitive"
   sensitive = true
} 