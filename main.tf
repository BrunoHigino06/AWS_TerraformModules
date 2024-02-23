resource "aws_iam_role" "iam_role" {
  count                 = length(var.iam_role)  
  name                  = var.iam_role[count.index].name
  force_detach_policies = var.iam_role[count.index].force_detach_policies
  assume_role_policy    = var.iam_role[count.index].assume_role_policy
  description           = var.iam_role[count.index].description
  managed_policy_arns   = var.iam_role[count.index].managed_policy_arns
  max_session_duration  = var.iam_role[count.index].max_session_duration
  name_prefix           = var.iam_role[count.index].name_prefix
  path                  = var.iam_role[count.index].path
  permissions_boundary  = var.iam_role[count.index].permissions_boundary
  inline_policy {
    name                = var.iam_role[count.index].inline_policy_name
    policy              = var.iam_role[count.index].inline_policy
  }
  tags                  = var.iam_role[count.index].tags
}