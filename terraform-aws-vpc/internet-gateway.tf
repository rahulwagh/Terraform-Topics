resource "aws_internet_gateway" "public_internet_gateway" {
  vpc_id = aws_vpc.vpc-jhooq-eu-central-1.id
  tags = {
    Name = "IGW: For Jhooq EU Central Project"
  }
}