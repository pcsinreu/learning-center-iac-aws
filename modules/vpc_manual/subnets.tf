#2) Create subnets

#Public subnets
resource "aws_subnet" "public_subnets" {
  count                   = length(var.public_subnet_cidrs) #2
  vpc_id                  = aws_vpc.vpc_aws.id
  cidr_block              = element(var.public_subnet_cidrs, count.index)
  availability_zone       = element(var.azs, count.index)
  map_public_ip_on_launch = true #This is what makes it a public subnet
  #Enable automatic public IP assignment on instance launch!
  tags = {
    Project = var.tag_project_name
    Name    = "public-subnet-${count.index + 1}"
  }
}

#Private subnets
resource "aws_subnet" "private_subnets" {
  count                   = length(var.private_subnet_cidrs) #2
  vpc_id                  = aws_vpc.vpc_aws.id
  cidr_block              = element(var.private_subnet_cidrs, count.index)
  availability_zone       = element(var.azs, count.index)
  map_public_ip_on_launch = false #This is what makes it a private subnet

  tags = {
    Project = var.tag_project_name
    Name    = "private-subnet-${count.index + 1}"
  }
}

# #DB subnets
resource "aws_subnet" "database_subnets" {
  count                   = length(var.database_subnet_cidrs) #2
  vpc_id                  = aws_vpc.vpc_aws.id
  cidr_block              = element(var.database_subnet_cidrs, count.index)
  availability_zone       = element(var.azs, count.index)
  map_public_ip_on_launch = false #This is what makes it a private subnet

  tags = {
    Project = var.tag_project_name
    Name    = "db-subnet-${count.index + 1}"
  }
}
