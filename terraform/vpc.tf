// VPC
resource "aws_vpc" "vocablens-vpc" {
  cidr_block = "10.0.0.0/24"
}

// Subnet for EKS
resource "aws_subnet" "vocablens-subnet" {
  vpc_id = aws_vpc.vocablens-vpc.id
  cidr_block = "10.0.0.0/24"

  // Define tags
  tags = {
    Name = "vocablens"
  }
}