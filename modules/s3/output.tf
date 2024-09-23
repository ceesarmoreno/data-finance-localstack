output "bucket_name" {
  description = "O ID do bucket S3"
  value       = aws_s3_bucket.bucket.bucket
}

output "bucket_arn" {
  description = "O ARN do bucket S3"
  value       = aws_s3_bucket.bucket.arn
}