provider "aws" {
   region     = "eu-central-1"
   access_key = "AKIATQ37NXB2MWNYG2FG"
   secret_key = "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"
}

resource "aws_s3_bucket" "spacelift-test1-s3" {
    bucket = "spacelift-test1-s3" 
    acl = "private"   
}

resource "aws_s3_bucket_object" "object1" {
    for_each = fileset("uploads/", "*")
    bucket = aws_s3_bucket.spacelift-test1-s3.id
    key = each.value
    source = "uploads/${each.value}"
    etag = filemd5("uploads/${each.value}")
}

