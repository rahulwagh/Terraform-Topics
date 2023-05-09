provider "aws" {
  region                   = "eu-central-1"
  shared_credentials_files = ["/Users/rahulwagh/.aws/credentials"]
}

resource "aws_s3_bucket" "my_test_bucket" {
  bucket = "test-bucket-2-for-import"
  tags = {
    "name" = "test-bucket"
  }
}

resource "aws_instance" "ec2_example" {
   ami           = "ami-0767046d1677be5a0"
   instance_type =  "t2.micro"

   tags = {
           Name = "Terraform EC2"
   }
  depends_on = [aws_s3_bucket.my_test_bucket]
}



