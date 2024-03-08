resource "aws_eks_node_group" "eks_node_group" {
  count                         = length(var.eks_node_group)  
  cluster_name                  = var.eks_node_group[count.index].cluster_name
  node_group_name               = var.eks_node_group[count.index].node_group_name
  node_role_arn                 = var.eks_node_group[count.index].node_role_arn
  subnet_ids                    = var.eks_node_group[count.index].subnet_ids
  ami_type                      = var.eks_node_group[count.index].ami_type
  capacity_type                 = var.eks_node_group[count.index].capacity_type
  disk_size                     = var.eks_node_group[count.index].disk_size
  force_update_version          = var.eks_node_group[count.index].force_update_version
  instance_types                = var.eks_node_group[count.index].instance_types
  labels                        = var.eks_node_group[count.index].labels
  node_group_name_prefix        = var.eks_node_group[count.index].node_group_name_prefix
  release_version               = var.eks_node_group[count.index].release_version
  version                       = var.eks_node_group[count.index].version
  taint {
    key                         = lookup(var.eks_node_group[count.index], "key", null)
    value                       = lookup(var.eks_node_group[count.index], "value", null)
    effect                      = lookup(var.eks_node_group[count.index], "effect", null)
  }
  remote_access {
    ec2_ssh_key                 = var.eks_node_group[count.index].ec2_ssh_key
    source_security_group_ids   = var.eks_node_group[count.index].source_security_group_ids
  }

  launch_template {
    id                          = lookup(var.eks_node_group[count.index], "id", null)
    name                        = lookup(var.eks_node_group[count.index], "name", null)
    version                     = lookup(var.eks_node_group[count.index], "version", null)
  }

  scaling_config {
    desired_size                = var.eks_node_group[count.index].desired_size
    max_size                    = var.eks_node_group[count.index].max_size
    min_size                    = var.eks_node_group[count.index].min_size
  }

  update_config {
    max_unavailable             = lookup(var.eks_node_group[count.index], "max_unavailable", null)
    max_unavailable_percentage  = lookup(var.eks_node_group[count.index], "max_unavailable_percentage", null)
  }

  tags                          = var.eks_node_group[count.index].tags
}