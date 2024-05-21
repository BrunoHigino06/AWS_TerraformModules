# netowork ACL resource
resource "aws_network_acl" "network_acl" {
  count       = length(var.network_acl)
  vpc_id      = var.network_acl[count.index].vpc_id
  subnet_ids  = [var.network_acl[count.index].subnet_ids]

  dynamic "egress" {
    for_each     = var.network_acl[count.index].egress
    content {
      protocol   = egress.value.protocol
      rule_no    = egress.value.rule_no
      action     = egress.value.action
      cidr_block = egress.value.cidr_block
      from_port  = egress.value.from_port
      to_port    = egress.value.to_port
    }
  }
  dynamic "ingress" {
    for_each     = var.network_acl[count.index].ingress
    content {
      protocol   = ingress.value.protocol
      rule_no    = ingress.value.rule_no
      action     = ingress.value.action
      cidr_block = ingress.value.cidr_block
      from_port  = ingress.value.from_port
      to_port    = ingress.value.to_port
    }
  }

  tags = merge(var.network_acl[count.index].tags,
    {Name = var.network_acl[count.index].name}
  )
}