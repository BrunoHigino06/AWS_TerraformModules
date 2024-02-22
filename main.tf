# Security groups resource
resource "aws_security_group" "security_group" {
  count                  = length(var.security_group)
  name                   = var.security_group[count.index].name
  description            = var.security_group[count.index].description
  vpc_id                 = var.security_group[count.index].vpc_id
  name_prefix            = var.security_group[count.index].name_prefix
  revoke_rules_on_delete = var.security_group[count.index].revoke_rules_on_delete

  dynamic ingress {
    for_each = var.security_group[count.index].ingress
    content {
      from_port        = ingress.value.from_port
      to_port          = ingress.value.to_port
      protocol         = ingress.value.protocol
      cidr_blocks      = ingress.value.cidr_blocks
      description      = ingress.value.description
      ipv6_cidr_blocks = ingress.value.ipv6_cidr_blocks
      prefix_list_ids  = ingress.value.prefix_list_ids
      security_groups  = ingress.value.security_groups
      self             = ingress.value.self
    }
  }

  dynamic egress {
    for_each = var.security_group[count.index].egress
    content {
      from_port        = egress.value.from_port
      to_port          = egress.value.to_port
      protocol         = egress.value.protocol
      cidr_blocks      = egress.value.cidr_blocks
      description      = egress.value.description
      ipv6_cidr_blocks = egress.value.ipv6_cidr_blocks
      prefix_list_ids  = egress.value.prefix_list_ids
      security_groups  = egress.value.security_groups
      self             = egress.value.self
    }
  }

  tags = merge(var.security_group[count.index].tags,
    {Name = var.security_group[count.index].name}
  )
}