output "documentdb_endpoint" {
  value       = aws_docdb_cluster.docdb.endpoint
  description = "DocumentDB endpoint"
}
output "documentdb_name" {
  value       = aws_docdb_cluster.docdb.id
  description = "DocumentDB Name"
}
