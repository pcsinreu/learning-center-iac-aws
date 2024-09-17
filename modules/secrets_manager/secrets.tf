resource "aws_secretsmanager_secret" "document-credentials" {
  name        = "document-credentials-${random_string.secrets_manager_name.id}"
  description = "Root user credentials for documentDB"

  tags = {
    Project = var.tag_project_name
  }
}

resource "aws_secretsmanager_secret_version" "document-credentials" {
  secret_id     = aws_secretsmanager_secret.document-credentials.id
  secret_string = <<EOF
  {
    "Username": "${var.documentdb_username}",
    "Password": "${random_password.master_password.result}"
  }
  EOF
}
