#CRIA O BUCKET
resource "aws_s3_bucket" "bucket" {
    bucket = var.bucket_name 
}

#DEFINE A UTILIZAÇÃO DA CHAVE DE CRIPTOGRAFIA
resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_sse" {
    bucket = aws_s3_bucket.bucket.id

    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = var.kms_key_arn
        sse_algorithm = "aws:kms"
      }
    }
}

#CONFIGURANDO OWNERSHIP
resource "aws_s3_bucket_ownership_controls" "bucket_ownership" {
  bucket = aws_s3_bucket.bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

#CONFIGURANDO ACL
resource "aws_s3_bucket_acl" "bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.bucket_ownership]

  bucket = aws_s3_bucket.bucket.id
  acl    = var.bucket_acl 
}