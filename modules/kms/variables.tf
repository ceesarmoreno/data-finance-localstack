variable "kms_key_description" {
  description = "Descrição da chave KMS"
  type        = string
  default     = "Criação de chave KMS para utilização na stack"
}

variable "enable_key_rotation" {
  description = "Indica se a rotação automática da chave está habilitada"
  type        = bool
  default     = true
}

variable "deletion_window_in_days" {
  description = "Número de dias antes que a chave KMS possa ser deletada"
  type        = number
  default     = 30
}

variable "kms_alias_name" {
  description = "Nome da alias para a chave KMS"
  type        = string
}
