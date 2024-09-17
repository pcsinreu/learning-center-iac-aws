variable "aws_region" {
  type        = string
  description = "Region"
}
variable "vpc_cidr_block" {
  type        = string
  description = "VPC CIDR block"
}
variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
}
variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR values"
}
variable "database_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR values"
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones"
}
variable "tag_project_name" {
  type        = string
  description = "Tag project name"
}
