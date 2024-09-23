output "function_allow" {
  value = aws_lambda_permission.allow_eventbridge.function_name
  description = "Name of lambda allow"
}

output "event_arn" {
  value = aws_lambda_permission.allow_eventbridge.source_arn
  description = "ARN of event related"
}