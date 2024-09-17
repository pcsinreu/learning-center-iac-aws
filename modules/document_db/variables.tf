variable "vpc_id" {
  description = "VPC CIDR block"
  type = string
}

variable "db_subnets_ids" {
  description = "Private Subnet CIDR values"
  type        = list(string)
}

variable "azs" {
  description = "Availability Zones"
  type        = list(string)
}

variable "documentdb_username" {
  description = "Username for documentDB"
  type        = string
}

variable "documentdb_password" {
  description = "Password for documentDB"
  type        = string
}

variable "documentdb_pg_tls" {
  description = "DocumentDB enable or disable TLS [enabled/disabled]"
  type        = string
}

variable "tag_project_name" {
  type        = string
  description = "Tag project name"
}


