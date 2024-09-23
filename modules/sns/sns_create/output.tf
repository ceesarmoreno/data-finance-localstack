output "sns_topic_name" {
  value = aws_sns_topic.sns_topic.name
  description = "Name of SNS topic"
}

output "sns_topic_arn" {
  value = aws_sns_topic.sns_topic.arn
  description = "ARN of SNS topic"
}