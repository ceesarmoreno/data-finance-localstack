output "sub_protocol" {
  value = aws_sns_topic_subscription.email_subscription.protocol
  description = "protocol"
}

output "sub_endpoint" {
  value = aws_sns_topic_subscription.email_subscription.endpoint
  description = "Endppint"
}