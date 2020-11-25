## About

Terraform module to create an S3 bucket with specific Cloudfront AOI and the resource policy to allow use the bucket as
Cloudfront origin.

**NB!** This module creates one origin access identity for each bucket. Please take into account the follows:
> An AWS account can have up to 100 CloudFront origin access identities (OAIs).
>
> -- [the AWS CloudFront documentation](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-restricting-access-to-s3.html)

If you plan to have more than 100 buckets with Cloudfront then the module is not suitable for you.  

## Usage

```hcl
module "my_assets" {
  source      = "github.com/jetbrains-infra/terraform-aws-s3-bucket-as-readonly-cloudfront-origin?ref=vX.X.X" // see https://github.com/jetbrains-infra/terraform-aws-s3-bucket-as-readonly-cloudfront-origin/releases
  bucket_name = "my-project-assets"
}
```

Default values:
```hcl
module "my_assets" {
  source        = "github.com/jetbrains-infra/terraform-aws-s3-bucket-as-readonly-cloudfront-origin?ref=vX.X.X" // see https://github.com/jetbrains-infra/terraform-aws-s3-bucket-as-readonly-cloudfront-origin/releases
  bucket_name   = "my-project-assets"
  versioning    = false
  force_destroy = false

  tags = {
    Module       = "S3 Bucket as ReadOnly Cloudfront Origin"
    ModuleSource = "https://github.com/jetbrains-infra/terraform-aws-s3-bucket-as-readonly-cloudfront-origin"
  }
}
```

## Outputs

* `oai_arn` - origin access identity ARN.
* `oai_path` - CloudFront access identity path.
* `bucket` - bucket name.
* `arn` - bucket arn.
* `domain` - bucket regional domain name.