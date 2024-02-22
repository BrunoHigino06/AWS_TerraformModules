output "transit_gateway_route_table_id" {
  value = aws_ec2_transit_gateway_route_table.transit_gateway_route_table[*].id
  description = "id of the transit gateway route table"
}

output "transit_gateway_route_table_arn" {
  value = aws_ec2_transit_gateway_route_table.transit_gateway_route_table[*].arn
  description = "arn of the transit gateway route table"
}