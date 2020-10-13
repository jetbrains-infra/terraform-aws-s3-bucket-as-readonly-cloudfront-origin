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
variable "force_destroy" {
  description = "Allow deleting the bucket with its content."
  default     = false
}

locals {
  bucket        = var.bucket_name
  versioning    = var.versioning
  force_destroy = var.force_destroy
  tags = merge({
    Module       = "S3 Bucket as ReadOnly Cloudfront Origin"
    ModuleSource = "https://github.com/jetbrains-infra/terraform-aws-s3-bucket-as-readonly-cloudfront-origin"
  }, var.tags)
}
