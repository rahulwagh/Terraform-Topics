provider "aws" {
  region                   = "eu-central-1"
  shared_credentials_files = ["/Users/rahulwagh/.aws/credentials"]
}

resource "aws_instance" "ec2_example" {
  #count = 4
  ami = "ami-0767046d1677be5a0"
  instance_type = "t2.micro"
  tags = {
    #Name = "test-t2-micro - ${count.index}"
    Name = "test-t2-micro"
  }
  key_name= "aws_key"
  vpc_security_group_ids = [aws_security_group.main.id]
}


resource "aws_security_group" "main" {
  egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
  ingress                = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 22
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 22
    }
  ]
}


resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDwmgMHFJE7J4qepIzAZL3/yC6J0zsEAb/oHYL+WBBDNUjSH4TeHUnHVNe9b/pyPcub+O/HNvlGrzSxUp0xT0b3O7kkTtgBKiG8NaBbonj+c7byfOGER80DYxc5adlBltuIDd8StFe7OMzbYyUSr1mdxDTIWm/OoE39G/fu3hTqUGkykv072GAy8nMFejITRw9pf+53B9ziE5rsdOUH4uqBiQa/Ng/qKo7h9MtJGcloRATYiObXwAgrHtt3sDrtvkq2ZceT906/BJm1Twlm+BHlQecHV18Ak3bzm/6HzlsA/q+yORsoB+VxSUxvVy0nXTc1X8vJAD4KSYVL5DTrpisdnQAIcuqAbea+LMku2o4sdnrrIlUi8/8BXeVbI4TNNGd0+sWpCVcDEhb4gyA/XXTvloQyjTYrL4+am/9XEY6NGdsrPK74sjvtpUZPUrmzTJ/mJWG5ncGY88GAj+YZAsY5pnAqh2CkR2TUpglugldnWyrppbe2QyC9iQkgUGSkBTs= rahulwagh@Rahuls-MacBook-Pro.local"
}


output "fetched_info_from_aws" {
  value = format("%s%s","ssh -i /Users/rahulwagh/.ssh/aws_ec2_terraform ubuntu@",aws_instance.ec2_example.public_ip)
}

# ssh -i /Users/rahulwagh/.ssh/aws_ec2_terraform ubuntu@52.59.249.49

/*variable "email" {
  default = "user@example.com"
}

output "is_valid_email" {
  value = "${regex("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$", var.email)}"
}*/

/*output "fetched_info_from_aws" {
  value = ["${aws_instance.ec2_example.*.public_dns}"]
}*/

//https://developer.hashicorp.com/terraform/language/functions/formatlist

/*variable "string_1" {
  default = "--this is lower case string--"
}

variable "string_2" {
  default = "--THIS IS UPPER CASE STRING--"
}

output "joined_string" {
  value = format("%s \n %s",upper(var.string_1),lower(var.string_2))
}*/
//Exmaple-1 : concat string
/*variable "greeting" {
  default = ["first", "second"]
}

variable "name" {
  default = ["third", "forth"]
}

output "greeting_message" {
  value = concat(var.greeting, var.name)
}

// Example-2 : substring

variable "string" {
  default = "Terraform is awesome"
}

output "substring" {
  value = "${substr(var.string, 0, 8)}"
}

// Example-3 how to use regex on string
variable "email" {
  default = "user@example.com"
}

output "is_valid_email" {
  value = "${regex("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$", var.email)}"
}


// Example-4 how to split
variable "my-test-string" {
  default = "Terraform,is,awesome"
}

output "splitted_string" {
  value = "${split(",", var.my-test-string)}"
}


// Example -5 join

variable "list" {
  default = ["Terraform", "is", "awesome"]
}

output "joined_string" {
  value = "${join(", ", var.list)}"
}


// Example-6 replace string

variable "string-to-replace" {
  default = "Terraform is awesome"
}

output "replaced_string" {
  value = "${replace(var.string-to-replace, "awesome", "great")}"
}

// Example 7 format
variable "person-name" {
  default = "John"
}

variable "age" {
  default = 25
}

output "formatted_string" {
  value = "${format("My name is %s and I am %d years old", var.person-name, var.age)}"
}

// Example 8 format

variable "greeting-msg" {
  default = "Hello"
}

variable "first-name" {
  default = "John"
}

output "greeting_message_ouput" {
  value = "${formatlist("%s, %s", var.greeting-msg, var.first-name)}"
}*/

