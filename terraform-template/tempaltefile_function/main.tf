provider "aws" {
  region = "eu-central-1"
  shared_credentials_files = ["/home/ubuntu/.aws/credentials"]
}

resource "aws_iam_policy" "default" {


  policy = templatefile("${path.module}/policy.tpl", {
    name = "Rahul Wagh - aws_iam-policy"
  })
}

output "policy" {
  value = "${aws_iam_policy.default.policy}"
}