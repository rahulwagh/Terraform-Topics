provider "aws" {
  region                   = "eu-central-1"
  shared_credentials_files = ["/Users/rahulwagh/.aws/credentials"]
}

resource "aws_s3_bucket" "spacelift-test2-s3" {
    bucket = "spacelift-test2-s3" 
    acl = "private"   
}




