# Create AWS VPC in eu-central-1
# CIDR - 10.0.0.0/16
resource "aws_vpc" "vpc-jhooq-eu-central-1" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "VPC: jhooq-eu-central-1"
  }
}



