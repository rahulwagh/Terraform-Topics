provider "aws" {
  region                   = "eu-central-1"
  shared_credentials_files = ["/Users/rahulwagh/.aws/credentials"]
}

resource "aws_instance" "ec2_example" {

    ami = "ami-0767046d1677be5a0"  
    instance_type = "t2.micro" 
    key_name= "key-for-demo-2"
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
  key_name   = "key-for-demo-2"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDNLgCPc/erVOSUSU7cbyH62zihY6/y7z4ctJnAevELH3QrJGFqHAsFppUkQtIA8lfqrdlZhEi7lS+3KmWRmHyT+qrRXvkabifmtlV79hTIuOQekl8Fw12WvZZDtO1iPkRWyHHN47zSMxn9DMPLQifz1q9RtchXDFFmPy0I4FRJttIGylN9hRLHFl6bqr0A9tEBo24gjfy3qFEzudNiDiVpl7XVe7NkkW2Zjo5pguNPhcNPDNnLb1QspUBLaITpdyIcrF+PJd+x7LEQCN2COnn1KofhyzIwyMo1m+7pdw3Pb40mli43HIhZhitRi6SuVF3Sja8Jbc13chGkmE+bBilN rahul@rahul-HP-ZBook-15-G2"
}

