locals {
    subnet_unique_names   = flatten([for subnet in var.ec2_instance : subnet.subnet_name])
    security_group_names  = flatten([for security_group in var.ec2_instance : security_group.security_group_name])
}

# Data subnets
  data "aws_subnet" "subnet" {
    for_each = { for subnet in local.subnet_unique_names : subnet => subnet ...}

    filter {
      name = "tag:unique_name"
      values = [each.key]
    }
  }

# Data Security group
  data "aws_security_group" "security_group" {
    for_each = { for security_group in local.security_group_names : security_group => security_group ...}

    filter {
      name = "tag:Name"
      values = [each.key]
    }
  }