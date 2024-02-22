# Transit gateway resource
resource "aws_ec2_transit_gateway" "transit_gateway" {
  count = length(var.transit_gateway)
  description                     = var.transit_gateway[count.index].description
  amazon_side_asn                 = var.transit_gateway[count.index].amazon_side_asn
  auto_accept_shared_attachments  = var.transit_gateway[count.index].auto_accept_shared_attachments
  default_route_table_association = var.transit_gateway[count.index].default_route_table_association
  default_route_table_propagation = var.transit_gateway[count.index].default_route_table_propagation
  dns_support                     = var.transit_gateway[count.index].dns_support
  transit_gateway_cidr_blocks     = var.transit_gateway[count.index].transit_gateway_cidr_blocks
  vpn_ecmp_support                = var.transit_gateway[count.index].vpn_ecmp_support

  tags = merge(var.transit_gateway[count.index].tags,
    {
      Name = var.transit_gateway[count.index].name
    }
  )
}