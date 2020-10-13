output "oai_arn" {
  value = aws_cloudfront_origin_access_identity.storage.iam_arn
}
output "bucket" {
  value = local.bucket
}
output "domain" {
  value = aws_s3_bucket.origin.bucket_regional_domain_name
}
