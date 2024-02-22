locals {
  internet_gateway_routes = flatten([for rt in var.route_table : [for route in rt.route : route.gateway_name]])
  transit_gateway_routes  = flatten([for rt in var.route_table : [for route in rt.route : route.transit_gateway_name]])
  nat_gateway_routes      = flatten([for rt in var.route_table : [for route in rt.route : route.nat_gateway_name]])
}

data "aws_internet_gateway" "internet_gateway_id" {
  for_each = { for internet_gateway in local.internet_gateway_routes : internet_gateway => internet_gateway ... if internet_gateway != null }

  filter {
    name   = "tag:Name"
    values = [each.key]
  }
}

data "aws_ec2_transit_gateway" "transit_gateway_id" {
  for_each = { for transit_gateway in local.transit_gateway_routes : transit_gateway => transit_gateway ... if transit_gateway != null }

  filter {
    name   = "tag:Name"
    values = [each.key]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

data "aws_nat_gateway" "nat_gateway_id" {
  for_each = { for nat_gateway in local.nat_gateway_routes : nat_gateway => nat_gateway ... if nat_gateway != null }

  filter {
    name   = "tag:Name"
    values = [each.key]
  }
}
