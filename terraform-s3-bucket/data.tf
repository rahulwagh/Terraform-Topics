data "vault_aws_access_credentials" "aws" {
  backend = "aws"
  role    = "my-role"
  type    = "sts"
}