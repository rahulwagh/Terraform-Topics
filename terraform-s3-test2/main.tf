provider "aws" {
   region     = "eu-central-1"
   access_key = "AKIATQ37NXB2MWNYG2FG"
   secret_key = "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"
}


resource "aws_s3_bucket" "spacelift-test2-s3" {
    bucket = "spacelift-test2-s3" 
    acl = "private"   
}




