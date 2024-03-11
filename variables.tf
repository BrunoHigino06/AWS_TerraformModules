variable "eks_node_group" {
  type = list(object({
    cluster_name                = string
    node_group_name             = string
    node_role_arn               = string
    subnet_ids                  = list(string)
    ami_type                    = optional(string) 
    capacity_type               = optional(string)
    disk_size                   = optional(string) 
    force_update_version        = optional(string) 
    instance_types              = optional(list(string))
    labels                      = optional(map(string))
    node_group_name_prefix      = optional(string)
    release_version             = optional(string)
    version                     = optional(string)
    ec2_ssh_key                 = optional(string) 
    source_security_group_ids   = optional(list(string))
    launch_template             = optiona(object({
      id                        = optional(string)
      name                      = optional(string)
      version                   = optional(string)
    })) 
    desired_size                = string
    max_size                    = string
    min_size                    = string
    max_unavailable_percentage  = string
    tags                        = map(string)
  }))
}