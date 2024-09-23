variable "sns_topic_name" {
  type = string
  description = "Name of SNS topic"
}

variable "kms_sns_arn" {
  type = string
  description = "KMS ARN of SNS topic"
}