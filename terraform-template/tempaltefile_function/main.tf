provider "aws" {
  region = "eu-central-1"
  shared_credentials_files = ["/home/vagrant/.aws/credentials"]
}

resource "aws_iam_policy" "default" {


  policy = templatefile("${path.module}/policy.tpl", {
    name = "Rahul Wagh"
  })
}

output "policy" {
  value = "${aws_iam_policy.default.policy}"
}