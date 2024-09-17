resource "aws_db_subnet_group" "db_subnet_group" {
  name = "main_document_db"

  subnet_ids = [
    var.db_subnets_ids[0],
    var.db_subnets_ids[1]
  ]

  tags = {
    Name    = "My DB subnet group"
    Project = var.tag_project_name
  }
}
