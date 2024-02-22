# transit_gateway_route_table resource
resource "aws_ec2_transit_gateway_route_table" "transit_gateway_route_table" {
  count              = length(var.transit_gateway_route_table)
  transit_gateway_id = var.transit_gateway_route_table[count.index].transit_gateway_id

  tags               = merge(var.transit_gateway_route_table[count.index].tags,
    {Name            = var.transit_gateway_route_table[count.index].name}
  )
}