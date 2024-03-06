variable "eks" {
    type                                              = list(object({
          name                                        = string
          role_arn                                    = string
          subnet_ids                                  = list(string)
          endpoint_private_access                     = optional(string)
          endpoint_public_access                      = optional(string)
          public_access_cidrs                         = optional(list(string))
          security_group_ids                          = optional(list(string))
          authentication_mode                         = optional(string)
          bootstrap_cluster_creator_admin_permissions = optional(string)
          resources                                   = optional(list(string))
          key_arn                                     = optional(string)
          service_ipv4_cidr                           = optional(string)
          ip_family                                   = optional(string)
          control_plane_instance_type                 = optional(string)
          outpost_arns                                = optional(string)
          group_name                                  = optional(string)
          enabled_cluster_log_types                   = optional(list(string))
          version                                     = optional(string)
          resources                                   = optional(list(string))
          outpost_arns                                = optional(list(string))
          tags                                        = map(string)
          use_encryption_config                       = optional(bool)
          use_kubernetes_network_config               = optional(bool)
          use_outpost_config                          = optional(bool)
        }
      )
    )
  default = [ {
          name                                        = null
          role_arn                                    = null
          subnet_ids                                  = null
          endpoint_private_access                     = null
          endpoint_public_access                      = null
          public_access_cidrs                         = null
          security_group_ids                          = null
          authentication_mode                         = null
          bootstrap_cluster_creator_admin_permissions = null
          resources                                   = null
          key_arn                                     = null
          service_ipv4_cidr                           = null
          ip_family                                   = null
          control_plane_instance_type                 = null
          outpost_arns                                = null
          group_name                                  = null
          enabled_cluster_log_types                   = null
          version                                     = null
          resources                                   = null
          outpost_arns                                = null
          tags                                        = null
          use_encryption_config                       = null
          use_kubernetes_network_config               = null
          use_outpost_config                          = null
  } ] 
}