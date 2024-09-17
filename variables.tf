variable "aws_region" {
  type        = string
  description = "Region"
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  type        = string
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
  default     = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR values"
  default     = ["10.0.2.0/24", "10.0.3.0/24"]
}

variable "database_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR values"
  default     = ["10.0.4.0/24", "10.0.5.0/24"]
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["us-east-1a", "us-east-1b"]
}

variable "ecr_name" {
  description = "The name of the ECR registry"
  type        = string
  default     = "frontend-image"
}
variable "image_mutability" {
  description = "Provide image mutability"
  type        = string
  default     = "IMMUTABLE"
}
variable "encrypt_type" {
  description = "Provide type of encryption here"
  type        = string
  default     = "KMS"
}
variable "documentdb_username" {
  description = "Username for documentDB"
  type        = string
  default     = "main"
}
variable "documentdb_pg_tls" {
  description = "DocumentDB enable or disable TLS [enabled/disabled]"
  type        = string
  default     = "disabled"
}

variable "ec2_ami" {
  type        = string
  description = "AMI"
  default     = "ami-0230bd60aa48260c6"
}

variable "instance_type" {
  type        = string
  description = "instance type"
  default     = "t2.micro"
}

variable "bastion_creation" {
  type        = bool
  description = "Create Bastion: true or false"
  default     = true
}

variable "tag_project_name" {
  type        = string
  description = "Tag project name"
  default     = "chupito"
}
variable "auth_uri" {
  type        = string
  description = "AUTH ID"
  default     = "string"
}

variable "token_uri" {
  type        = string
  description = "TOKEN URI"
  default     = "string"
}

variable "auth_provider_cert_url" {
  type        = string
  description = "AUTH PROVIDER CERT URLD"
  default     = "string"
}

variable "db_root_username" {
  type        = string
  description = "DB ROOT USERNAME"
  default     = "string"
}

