locals {
  vpc_name = flatten([for internet_gateway in var.internet_gateway : internet_gateway.vpc_name])
}

data "aws_vpc" "data_vpc_id" {
  for_each = { for vpc in local.vpc_name : vpc => vpc }
  filter {
    name   = "tag:Name"
    values = [each.key]
  }
}