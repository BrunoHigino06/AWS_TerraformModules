resource "aws_eks_cluster" "main" {
  count                     = length(var.eks) 
  name                      = var.eks[count.index].name
  role_arn                  = var.eks[count.index].role_arn
  enabled_cluster_log_types = var.eks[count.index].enabled_cluster_log_types
  version                   = var.eks[count.index].version 
  vpc_config {
    subnet_ids              = var.eks[count.index].subnet_ids
    endpoint_private_access = var.eks[count.index].endpoint_private_access
    endpoint_public_access  = var.eks[count.index].endpoint_public_access
    public_access_cidrs     = var.eks[count.index].public_access_cidrs
    security_group_ids      = var.eks[count.index].security_group_ids
  }

  access_config {
    authentication_mode                         = var.eks[count.index].authentication_mode
    bootstrap_cluster_creator_admin_permissions = var.eks[count.index].bootstrap_cluster_creator_admin_permissions
  }

  kubernetes_network_config {
    service_ipv4_cidr = var.eks[count.index].service_ipv4_cidr
    ip_family         = var.eks[count.index].ip_family
  }

  tags = var.eks[count.index].tags
}