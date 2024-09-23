output "kms_alias_name" {
  description = "Mapa de aliases para ARNs das chaves KMS"
  value = aws_kms_alias.kms_alias.name
}

output "kms_alias_arn" {
  description = "Mapa de aliases para ARNs das chaves KMS"
  value = aws_kms_key.kms_key.arn
}