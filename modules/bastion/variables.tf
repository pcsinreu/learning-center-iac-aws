variable "vpc_id" {
  type = string
  description = "value"
}

variable "public_subnets_ids" {
  type = list(string)
  description = "Public Subnet CIDR values"
}

variable "ec2_ami" {
  type        = string
  description = "AMI"
}

variable "instance_type" {
  type        = string
  description = "instance type"
}

variable "tag_project_name" {
  type        = string
  description = "Tag project name"
}