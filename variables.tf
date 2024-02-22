# subnet vars
variable "subnet" {
  type                                             = list(object({
    name                                           = string
    unique_name                                    = string
    vpc_id                                         = optional(string)
    cidr_block                                     = optional(string)
    assign_ipv6_address_on_creation                = optional(string)
    availability_zone                              = optional(string)
    availability_zone_id                           = optional(string)
    customer_owned_ipv4_pool                       = optional(string)
    enable_dns64                                   = optional(string)
    enable_lni_at_device_index                     = optional(string)
    enable_resource_name_dns_aaaa_record_on_launch = optional(string)
    ipv6_cidr_block                                = optional(string)
    ipv6_native                                    = optional(string)
    map_customer_owned_ip_on_launch                = optional(string)
    map_public_ip_on_launch                        = optional(string)
    outpost_arn                                    = optional(string)
    private_dns_hostname_type_on_launch            = optional(string)
    tags                                           = map(string)
    }))
    description = "subnet variables"
    default = null
}