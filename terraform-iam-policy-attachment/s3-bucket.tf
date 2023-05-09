resource "aws_s3_bucket" "example" {
  bucket = "test-bucket-for-alice"

  tags = {
    Name        = "test-bucket-for-alice"
    Environment = "Dev"
  }
}