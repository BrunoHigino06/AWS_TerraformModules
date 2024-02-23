variable "iam_role" {
  type                    = list(object({
    name                  = string
    assume_role_policy    = string
    desdescription        = optional(string)
    force_detach_policies = optional(string)
    inline_policy_name    = optional(string)
    inline_policy         = optional(string)
    managed_policy_arns   = optional(list(string))
    max_session_duration  = optional(string)
    name_prefix           = optional(string)
    path                  = optional(string)
    permissions_boundary  = optional(string)
    tags                  = map(string)
  }))
}