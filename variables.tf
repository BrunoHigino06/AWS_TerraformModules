# transit_gateway variables
variable "transit_gateway" {
  type                              = list(object({
    name                            = string
    tags                            = map(string)
    description                     = optional(string)
    amazon_side_asn                 = optional(string)
    auto_accept_shared_attachments  = optional(string)
    default_route_table_association = optional(string)
    default_route_table_propagation = optional(string)
    dns_support                     = optional(string)
    transit_gateway_cidr_blocks     = optional(list(string))
    vpn_ecmp_support                = optional(string)
  }))
  default = null
  description = "Transit gateway variables"
}