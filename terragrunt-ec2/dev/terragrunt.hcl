terraform {
  source = "tfr:///terraform-aws-modules/ec2-instance/aws?version=4.0.0"
}

locals {
  env_vars = yamldecode(
  file("${find_in_parent_folders("common-environment.yaml")}"),
  )
}

/*include {
  path = find_in_parent_folders()
}*/

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  provider "aws" {
    profile = "default"
    region  = "eu-central-1"
    shared_credentials_file = "/Users/rwagh/credentials"
  }
EOF
}

inputs = {
  ami           = "ami-0767046d1677be5a0"
  instance_type = local.env_vars.locals.instance_type
  tags = {
    Name = "Terragrunt Tutorial: EC2"
  }
}