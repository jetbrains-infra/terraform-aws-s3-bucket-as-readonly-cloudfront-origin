output "oai_arn" {
  value = aws_cloudfront_origin_access_identity.storage.iam_arn
}
output "oai_path" {
  value = aws_cloudfront_origin_access_identity.storage.cloudfront_access_identity_path
}
output "bucket" {
  value = local.bucket
}
output "arn" {
  value = aws_s3_bucket.origin.arn
}
output "domain" {
  value = aws_s3_bucket.origin.bucket_regional_domain_name
}
