output "documentdb_root_password" {
  value = random_password.master_password.result
}
