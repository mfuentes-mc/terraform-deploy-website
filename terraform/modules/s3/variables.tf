variable "bucket-name" {
  description = "Name of S3 bucket"
  type        = string
}

variable "environment" {
  description = "Environment variable"
  type        = string
}

variable "create_bucket" {
  description = "Whether to create the S3 bucket"
  type        = bool
  default     = true
}