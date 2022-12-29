provider "aws" {
  region     = "eu-central-1"
  shared_credentials_files = ["/Users/rahulwagh/.aws/credentials"]
}

#terraform import aws_instance.ec2_example i-097f1ec37854d01c2
#terraform show
#resource "aws_instance" "ec2_example" {
#  ami                                  = "ami-06ce824c157700cd2"
#  instance_type                        = "t2.micro"
#  tags = {
#    "Name" = "my-test-ec2"
#  }
#}

#terraform import aws_s3_bucket.my_test_bucket test-bucket-1-for-import
resource "aws_s3_bucket" "my_test_bucket" {
  bucket = "test-bucket-1-for-import"
  tags = {
    "name" = "test-bucket"
  }
}
#
## terraform import aws_s3_bucket_acl.example test-bucket-1-for-import
resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.my_test_bucket.id
}