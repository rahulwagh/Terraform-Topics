
resource "aws_iam_role" "alice_role" {
  name = "AliceRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}
resource "aws_iam_policy" "allow_s3_access" {
  name        = "AllowS3Access"
  description = "Allow Alice to access specific S3 resources"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:ListBucket",
          "s3:GetObject",
          "s3:PutObject"
        ]
        Effect = "Allow"
        Resource = [
          "arn:aws:s3:::test-bucket-for-alice",
          "arn:aws:s3:::test-bucket-for-alice/*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_s3_access" {
  policy_arn = aws_iam_policy.allow_s3_access.arn
  role       = aws_iam_role.alice_role.name
}