output "role_name" {
    value = aws_iam_role.role.name
    description = "Role name"
}

output "role_arn" {
    value = aws_iam_role.role.arn
    description = "Role ARN"
}

