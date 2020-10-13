output "oai_arn" {
  value = aws_cloudfront_origin_access_identity.storage.iam_arn
}

output "bucket" {
  value = local.bucket
}
