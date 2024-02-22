# security group vars
variable "security_group" {
  type                     = list(object({
    vpc_id                 = string
    tags                   = map(string)
    name                   = optional(string)
    name_prefix            = optional(string)
    description            = optional(string)
    revoke_rules_on_delete = optional(string)
    egress                 = list(object({
      from_port            = string 
      to_port              = string
      protocol             = string
      cidr_blocks          = optional(list(string))
      description          = optional(string)
      ipv6_cidr_blocks     = optional(list(string))
      prefix_list_ids      = optional(list(string))
      security_groups      = optional(list(string))
      self                 = optional(string)
    }))
    ingress       = list(object({
      from_port            = string 
      to_port              = string
      protocol             = string
      cidr_blocks          = optional(list(string))
      description          = optional(string)
      ipv6_cidr_blocks     = optional(list(string))
      prefix_list_ids      = optional(list(string))
      security_groups      = optional(list(string))
      self                 = optional(string)
    }))
  }))
}