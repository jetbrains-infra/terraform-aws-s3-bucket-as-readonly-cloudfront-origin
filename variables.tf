variable "bucket_name" {
  description = "Bucket name."
}
variable "tags" {
  description = "Tags."
  type        = map(string)
  default     = {}
}
variable "versioning" {
  description = "Enable versioning support."
  default     = false
}

locals {
  bucket     = var.bucket_name
  versioning = var.versioning
  tags = merge({
    Module       = "S3 Bucket as ReadOnly Cloudfront Origin"
    ModuleSource = "https://github.com/jetbrains-infra/terraform-aws-s3-bucket-as-readonly-cloudfront-origin"
  }, var.tags)
}
