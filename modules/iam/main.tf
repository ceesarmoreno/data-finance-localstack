resource "aws_iam_role" "role" {
    name = var.role_name
    description = "Role creation"
    assume_role_policy = file(var.role_path)
}

resource "aws_iam_policy" "policy" {
  name = var.policy_name
  description = "Policy creation for role"
  path = "/"
  policy = file(var.policy_path) 
}

resource "aws_iam_role_policy_attachment" "policy_attachment" {
  role = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policy.arn

  depends_on = [aws_iam_role.role,aws_iam_policy.policy]
}