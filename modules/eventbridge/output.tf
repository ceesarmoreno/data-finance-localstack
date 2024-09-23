output "event_rule_name" {
    value = aws_cloudwatch_event_rule.eventrule.name
    description = "Name of event rule"
}

output "event_rule_arn" {
    value = aws_cloudwatch_event_rule.eventrule.arn
    description = "ARN of event rule"
}