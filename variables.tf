# transit_gateway_route_table variables
variable "transit_gateway_route_table" {
  type                 = list(object({
    name               = string
    tags               = map(string)
    transit_gateway_id = string
  }))
  default = null
  description = "Transit gateway route table variables"
}