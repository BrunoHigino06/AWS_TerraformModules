locals {
  internet_gateway_name = flatten([for association in var.route_table_association : association.gateway_name])
  subnet_unique_names     = flatten([for association in var.route_table_association : association.subnet_unique_name])
  route_table_unique_name = flatten([for association in var.route_table_association : association.route_table_unique_name])
}

data "aws_internet_gateway" "internet_gateway_id" {
  for_each = { for igw in local.internet_gateway_name : igw => igw ... if igw != null }

  filter {
    name   = "tag:Name"
    values = [each.key]
  }
}


data "aws_subnet" "data_subnet_id" {
  for_each = { for subnet in local.subnet_unique_names : subnet => subnet ... if subnet != null}

  filter {
    name = "tag:unique_name"
    values = [each.key]
  }
  
}

data "aws_route_table" "route_table_id" {
  for_each = { for route_table in local.route_table_unique_name : route_table => route_table ... if route_table != null}

  filter {
    name = "tag:unique_name"
    values = [each.key]
  }
}