# vpc vars
variable "vpc" {
  type                                   = object({
    name                                 = string
    cidr_block                           = string
    instance_tenancy                     = optional(string)
    ipv4_ipam_pool_id                    = optional(string)
    ipv4_netmask_length                  = optional(string)
    ipv6_cidr_block                      = optional(string)
    ipv6_ipam_pool_id                    = optional(string)
    ipv6_netmask_length                  = optional(string)
    ipv6_cidr_block_network_border_group = optional(string)
    enable_dns_support                   = optional(string)
    enable_network_address_usage_metrics = optional(string)
    enable_dns_hostnames                 = optional(string)
    assign_generated_ipv6_cidr_block     = optional(string)
    tags                                 = map(string)
    })
    description = "vpc variables"
    default = null
}

# Secundary IPV4 vars
variable "secondary_cidr" {
  type = object({
    use_secundary_ipv4 = bool
    cidr_block     = list(string)
  })
  description = "list of a secundary IPV4 to add to the vpc"
  default = {
    use_secundary_ipv4 = false
    cidr_block = [null]
  }
}