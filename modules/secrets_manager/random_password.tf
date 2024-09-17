resource "random_password" "master_password" {
  length  = 16
  special = false
}

resource "random_string" "secrets_manager_name" {
  length  = 8
  special = false
}
