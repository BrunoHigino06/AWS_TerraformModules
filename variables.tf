variable "iam_role_policy_attachment" {
  type          = list(object({
    role        = string
    policy_arn  = string
  }))
}