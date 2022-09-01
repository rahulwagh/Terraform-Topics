provider "aws" {
   region     = "eu-central-1"
   access_key = ""
   secret_key = ""
}
resource "aws_instance" "ec2_example" {

   ami           = "ami-0767046d1677be5a0"
   instance_type =  "t2.micro"

   tags = {
           Name = "Terraform EC2"
   }
}

output "my_console_output" {
  value = aws_instance.ec2_example.public_ip
} 