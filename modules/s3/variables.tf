variable "bucket_name" {
  description = "O nome do bucket S3"
  type        = string
}

variable "kms_key_arn" {
  description = "O ARN da chave KMS usada para criptografia do lado do servidor"
  type        = string
}

variable "bucket_acl" {
  description = "A configuração ACL para o bucket S3"
  type        = string
  default     = "public-read-write"
}