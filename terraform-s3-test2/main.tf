provider "aws" {
   region     = "eu-central-1"
   access_key = "AKIATQ37NXB2MWNYG2FG"
   secret_key = "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"
}

# access control lists (ACLs)

resource "aws_s3_bucket_object" "upload" {
    bucket = "spacelift-test1-s3" 
    key = "test2-key"
    source = "/home/rahul/Projects/Terraform-Topics/terraform-s3-test2/test2.txt"
    #tags = filemd5("/home/rahul/Projects/Terraform-Topics/terraform-s3-test2/test2.txt")
    etag = filemd5("/home/rahul/Projects/Terraform-Topics/terraform-s3-test2/test2.txt")
}



