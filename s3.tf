resource "aws_s3_bucket" "origin" {
  bucket        = local.bucket
  acl           = "private"
  tags          = local.tags
  force_destroy = local.force_destroy
  versioning {
    enabled = local.versioning
  }
}

data "aws_iam_policy_document" "read_only_access" {
  statement {
    principals {
      identifiers = [aws_cloudfront_origin_access_identity.storage.iam_arn]
      type        = "AWS"
    }
    actions   = ["s3:GetObject"]
    resources = ["arn:aws:s3:::${local.bucket}/*"]
  }
}

resource "aws_s3_bucket_policy" "read_only" {
  bucket = aws_s3_bucket.origin.bucket
  policy = data.aws_iam_policy_document.read_only_access.json
}
