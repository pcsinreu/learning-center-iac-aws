#3) Internet Gateway (IGW)
resource "aws_internet_gateway" "igw_aws" {
  vpc_id = aws_vpc.vpc_aws.id

  tags = {
    Project = var.tag_project_name
  }
}

#4) Create 2nd Route Table for Public Subnets, 
resource "aws_route_table" "public_subnet_rt" {
  vpc_id = aws_vpc.vpc_aws.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_aws.id
  }

  tags = {
    Project = var.tag_project_name
  }
}

#Public subnets associated to PublicSubRT
resource "aws_route_table_association" "public_subnets_associations" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = aws_route_table.public_subnet_rt.id
}
