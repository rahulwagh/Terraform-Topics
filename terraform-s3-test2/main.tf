provider "aws" {
   region     = "eu-central-1"
   access_key = ""
   secret_key = ""
}


resource "aws_s3_bucket" "spacelift-test2-s3" {
    bucket = "spacelift-test2-s3" 
    acl = "private"   
}




