variable "vpc_id" {
  type        = string
  description = "VPC CIDR block"
}
variable "public_subnets_ids" {
  type        = list(string)
  description = "Public Subnet CIDR values"
}
variable "private_subnets_ids" {
  type        = list(string)
  description = "Private Subnet CIDR values"
}
variable "documentdb_username" {
  description = "Username for documentDB"
  type        = string
}
variable "documentdb_password" {
  description = "Password for documentDB"
  type        = string
}
variable "documentdb_endpoint" {
  description = "DocumentDB endpoint"
  type        = string
}
variable "documentdb_name" {
  description = "DocumentDB name"
  type        = string
}
variable "tag_project_name" {
  type        = string
  description = "Tag project name"
}
variable "account_id" {
  type        = string
  description = "AWS Account ID"
}
variable "auth_uri" {
  type        = string
  description = "AUTH ID"
}

variable "token_uri" {
  type        = string
  description = "TOKEN URI"
}

variable "auth_provider_cert_url" {
  type        = string
  description = "AUTH PROVIDER CERT URLD"
}

variable "db_root_username" {
  type        = string
  description = "DB ROOT USERNAME"
}



