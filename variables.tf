# transit_gateway_vpc_attachment variables
variable "transit_gateway_vpc_attachment" {
  type = list(object({
    name                                              = string
    subnet_unique_names                               = list(string)
    transit_gateway_name                              = string
    vpc_name                                          = string
    tags                                              = map(string)
    appliance_mode_support                            = optional(string) 
    dns_support                                       = optional(string) 
    ipv6_support                                      = optional(string) 
    transit_gateway_default_route_table_association   = optional(string) 
    transit_gateway_default_route_table_propagation   = optional(string) 
  }))
}