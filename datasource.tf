locals {
  subnet_unique_names     = flatten([for subnet_group in var.db_subnet_group : subnet_group.subnet_unique_name])
}

data "aws_subnet" "data_subnet_id" {
  for_each = { for subnet in local.subnet_unique_names : subnet => subnet ... if subnet != null}

  filter {
    name = "tag:unique_name"
    values = [each.key]
  }
  
}