resource "aws_iam_role_policy_attachment" "iam_role_policy_attachment" {
  count         = length(var.iam_role_policy_attachment)  
  role          = var.iam_role_policy_attachment[count.index].role
  policy_arn    = var.iam_role_policy_attachment[count.index].policy_arn
}