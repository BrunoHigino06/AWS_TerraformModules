# Subnet resource
resource "aws_subnet" "subnet" {
  count                                          = length(var.subnet)
  vpc_id                                         = var.subnet[count.index].vpc_id
  cidr_block                                     = var.subnet[count.index].cidr_block
  assign_ipv6_address_on_creation                = var.subnet[count.index].assign_ipv6_address_on_creation
  availability_zone                              = var.subnet[count.index].availability_zone
  availability_zone_id                           = var.subnet[count.index].availability_zone_id
  customer_owned_ipv4_pool                       = var.subnet[count.index].customer_owned_ipv4_pool
  enable_dns64                                   = var.subnet[count.index].enable_dns64
  enable_lni_at_device_index                     = var.subnet[count.index].enable_lni_at_device_index
  enable_resource_name_dns_aaaa_record_on_launch = var.subnet[count.index].enable_resource_name_dns_aaaa_record_on_launch
  ipv6_cidr_block                                = var.subnet[count.index].ipv6_cidr_block
  ipv6_native                                    = var.subnet[count.index].ipv6_native
  map_customer_owned_ip_on_launch                = var.subnet[count.index].map_customer_owned_ip_on_launch
  map_public_ip_on_launch                        = var.subnet[count.index].map_public_ip_on_launch
  outpost_arn                                    = var.subnet[count.index].outpost_arn
  private_dns_hostname_type_on_launch            = var.subnet[count.index].private_dns_hostname_type_on_launch
  tags                                           = merge(var.subnet[count.index].tags,
    {
      Name = var.subnet[count.index].name,
      unique_name = var.subnet[count.index].unique_name
    }
  )
}