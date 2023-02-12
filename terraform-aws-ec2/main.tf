provider "aws" {
   region                   = "eu-central-1"
   shared_credentials_files = ["/Users/rahulwagh/.aws/credentials"]
}

resource "aws_instance" "ec2_example" {
   ami           = "ami-0767046d1677be5a0"
   instance_type =  "%{ if var.instance_type != "" }${var.instance_type}%{ else }t2.micro%{ endif }"
   tags = {
           Name = "Terraform EC2"
   }
}


variable "instance_type" {
   description = "Instance type t2.micro"
   type        = string
   default     = ""

#  validation {
#   condition     = can(regex("^[Tt][2-3].(nano|micro|small)", var.instance_type))
#   error_message = "Invalid Instance Type name. You can only choose - t2.nano,t2.micro,t2.small"
# }
}