resource "aws_cloudfront_origin_access_identity" "storage" {
  comment = "Identity for S3 '${local.bucket}' bucket."
}
