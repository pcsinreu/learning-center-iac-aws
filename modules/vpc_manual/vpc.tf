#1) AWS VPC
resource "aws_vpc" "vpc_aws" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default" //It's not dedicated, by default is cheaper than dedicated

  tags = {
    Project = var.tag_project_name
    Name    = "vpc_main"
  }
}

resource "aws_vpc_dhcp_options" "default" {
  domain_name_servers = ["AmazonProvidedDNS"]
  domain_name         = "ec2.internal"
  ntp_servers         = ["169.254.169.123"] # Amazon provided NTP servers
}

resource "aws_vpc_dhcp_options_association" "default" {
  vpc_id          = aws_vpc.vpc_aws.id
  dhcp_options_id = aws_vpc_dhcp_options.default.id
}
