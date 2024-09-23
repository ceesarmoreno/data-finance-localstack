output "sqs_queue_name" {
  value = aws_sqs_queue.sqs_queue.name
  description = "Name of SQS queue"
}

output "sqs_queue_arn" {
  value = aws_sqs_queue.sqs_queue.arn
  description = "ARN of SQS queue"
}

output "sqs_queue_url" {
  value = aws_sqs_queue.sqs_queue.url
  description = "URL of SQS queue"
}

output "sqs_queue_dlq_name" {
  value = aws_sqs_queue.sqs_dlq_queue.name
  description = "Name of SQS queue"
}

output "sqs_queue_dlq_arn" {
  value = aws_sqs_queue.sqs_dlq_queue.arn
  description = "ARN of SQS queue"
}

output "sqs_queue_dlq_url" {
  value = aws_sqs_queue.sqs_dlq_queue.url
  description = "URL of SQS queue"
}