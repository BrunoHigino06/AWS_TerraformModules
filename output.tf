output "network_acl_id" {
  value = aws_network_acl.network_acl[*].id
  description = "Network ACL ID"
}