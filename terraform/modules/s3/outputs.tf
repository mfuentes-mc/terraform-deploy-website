
//el value lo obtenemos del recurso que se crea en 
//el main.tf haciendo referecia al objeto s3
output "bucket_arn" {
  description = "ARN S3 Bucket"
  value       = ""
}

output "bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.angular_app_bucket.bucket
}
