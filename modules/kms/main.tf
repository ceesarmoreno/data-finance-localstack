#CRIA O KMS KEY
resource "aws_kms_key" "kms_key" {
    description = var.kms_key_description
    enable_key_rotation = var.enable_key_rotation
    deletion_window_in_days = var.deletion_window_in_days
}

#CRIA E ASSOCIA UMA POLICY A CHAVE CRIADA
resource "aws_kms_key_policy" "kms_key_policy" {
  key_id = aws_kms_key.kms_key.id
  policy = jsonencode({
    Id = "kms_key_policy"
    Statement = [
      {
        Action = "kms:*"
        Effect = "Allow"
        Principal = {
          AWS = "*"
        }

        Resource = "*"
        Sid      = "Enable IAM User Permissions"
      },
    ]
    Version = "2012-10-17"
  })
}

#CRIA UMA ALIAS PARA UTILIZAÇÃO FACILITADA
resource "aws_kms_alias" "kms_alias" {
  name = "alias/${var.kms_alias_name}"
  target_key_id = aws_kms_key.kms_key.key_id

  depends_on = [aws_kms_key.kms_key]
}