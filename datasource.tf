locals {
  subnet_unique_names  = flatten([for attachment in var.transit_gateway_vpc_attachment : attachment.subnet_unique_names])
  vpc_name             = flatten([for attachment in var.transit_gateway_vpc_attachment : attachment.vpc_name])
  transit_gateway_name = flatten([for attachment in var.transit_gateway_vpc_attachment : attachment.transit_gateway_name])
}

data "aws_subnet" "data_subnet_id" {
  for_each = { for subnet in local.subnet_unique_names : subnet => subnet }

  filter {
    name = "tag:unique_name"
    values = [each.key]
  }
  
}

data "aws_vpc" "data_vpc_id" {
  for_each = { for vpc in local.vpc_name : vpc => vpc }
  filter {
    name   = "tag:Name"
    values = [each.key]
  }
}

data "aws_ec2_transit_gateway" "data_transit_gateway_id" {
  for_each = { for transit_gateway_name in local.transit_gateway_name : transit_gateway_name => [transit_gateway_name]... }
  filter {
    name   = "tag:Name"
    values = [each.key]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}