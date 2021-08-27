provider "aws" {
   region     = "eu-central-1"
   access_key = "AKIATQ37NXB2OE336Z5R"
   secret_key = "825J+ECc0A1sBCp9vv4ip6sFFxM98ZAbOQGxh28w"
   
}

resource "aws_instance" "ec2_example" {

    ami = "ami-0767046d1677be5a0"  
    instance_type = "t2.micro" 
    tags = {
        Name = "Terraform EC2"
    }

  provisioner "local-exec" {
    command = "touch hello-jhooq.txt"
  }
}