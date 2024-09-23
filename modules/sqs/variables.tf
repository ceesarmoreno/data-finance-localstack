variable "sqs_queue_name" {
    type = string
    description = "SQS queue name"
}

variable "kms_sqs_arn" {
    type = string
    description = "KMS of SQS"
}
