resource "aws_eks_cluster" "main" {
  count                     =  length(var.eks) 
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

  
  dynamic "encryption_config" {
    for_each = var.eks[count.index].use_encryption_config !="" ? [false] : [true]
    content {
      resources = var.eks[count.index].resources
      provider {
        key_arn = var.eks[count.index].key_arn
      }
    }
  }

  dynamic "kubernetes_network_config" {
    for_each            = var.eks[count.index].use_kubernetes_network_config !="" ? [false] : [true]
    content {
      service_ipv4_cidr = var.eks[count.index].service_ipv4_cidr
      ip_family         = var.eks[count.index].ip_family
    }
  }

  dynamic "outpost_config" {
    for_each                      = var.eks[count.index].use_outpost_config !="" ? [false] : [true]
    content {
      control_plane_instance_type = var.eks[count.index].control_plane_instance_type
      outpost_arns                = var.eks[count.index].outpost_arns
      control_plane_placement {
        group_name                = var.eks[count.index].group_name
      }
    }
  }
  tags = var.eks[count.index].tags
}