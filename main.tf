# route table association resource
resource "aws_route_table_association" "route_table_association" {
  count          = length(var.route_table_association)
  subnet_id      = var.route_table_association[count.index].subnet_unique_name != null ? data.aws_subnet.data_subnet_id[var.route_table_association[count.index].subnet_unique_name].id : null  
  route_table_id = var.route_table_association[count.index].route_table_unique_name != null ? data.aws_route_table.route_table_id[var.route_table_association[count.index].route_table_unique_name].id : null
  gateway_id     = var.route_table_association[count.index].gateway_name != null ? data.aws_internet_gateway.internet_gateway_id[var.route_table_association[count.index].gateway_name].id : null

  depends_on = [
    data.aws_internet_gateway.internet_gateway_id,
    data.aws_route_table.route_table_id,
    data.aws_subnet.data_subnet_id
  ]
}