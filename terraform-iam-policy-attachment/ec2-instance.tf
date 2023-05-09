
resource "aws_instance" "ec2_example" {
  ami = "ami-0767046d1677be5a0"
  instance_type = "t2.micro"
  tags = {
    Name = "test-t2-micro"
  }
  key_name= "aws_key"
  vpc_security_group_ids = [aws_security_group.main.id]
  iam_instance_profile = aws_iam_instance_profile.alice_profile.name
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