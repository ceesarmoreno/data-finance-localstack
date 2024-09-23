#CRIA UMA DLQ
resource "aws_sqs_queue" "sqs_dlq_queue" {
  name                      = "${var.sqs_queue_name}-dlq"
  message_retention_seconds = 1209600
}

#CRIA A FILA SQS E ASSOCIA A DLQ
resource "aws_sqs_queue" "sqs_queue" {
    name = var.sqs_queue_name
    kms_master_key_id = var.kms_sqs_arn
    message_retention_seconds = 86400
    visibility_timeout_seconds = 30

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.sqs_dlq_queue.arn
    maxReceiveCount = 5 
  })

}




