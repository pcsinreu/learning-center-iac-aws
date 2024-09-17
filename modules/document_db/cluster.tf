resource "aws_docdb_cluster" "docdb" {
  #CONFIGURATION
  cluster_identifier              = "my-docdb-cluster"
  engine                          = "docdb"
  db_cluster_parameter_group_name = aws_docdb_cluster_parameter_group.pg_document_db.id

  #AUTHENTICATION
  master_username = var.documentdb_username
  master_password = var.documentdb_password

  #NETWORK SETTINGS
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.vpc_documentdb_sg.id]
  availability_zones     = [var.azs[0], var.azs[1]]

  #CLUSTER OPTIONS
  port = 27017

  #ENCRYPTION-AT-REST
  storage_encrypted = true

  #BACKUP
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"

  #TAGS
  tags = {
    Project = var.tag_project_name
  }

  #DELETION PROTECTION
  skip_final_snapshot = true
}

resource "aws_security_group" "vpc_documentdb_sg" {
  name        = "security-group-documendb"
  vpc_id      = var.vpc_id
  description = "Allow 27017"

  ingress {
    protocol    = "tcp"
    from_port   = 27017
    to_port     = 27017
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Project = var.tag_project_name
  }
}

resource "aws_docdb_cluster_parameter_group" "pg_document_db" {
  family      = "docdb5.0"
  name        = "document-db-parameter-group"
  description = "docdb cluster parameter group"

  parameter {
    name  = "tls"
    value = var.documentdb_pg_tls
  }
}
