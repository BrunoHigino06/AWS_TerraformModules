# netowork ACL vars
variable "network_acl" {
  type            = list(object({
    name          = string
    vpc_id        = string
    tags          = map(string)
    subnet_ids    = optional(string)
    egress        = list(object({
      protocol    = string 
      rule_no     = string
      action      = string
      cidr_block  = string
      from_port   = string
      to_port     = string
    }))
    ingress       = list(object({
      protocol    = string 
      rule_no     = string
      action      = string
      cidr_block  = string
      from_port   = string
      to_port     = string
    }))
  }))
}