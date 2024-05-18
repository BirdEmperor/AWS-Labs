module "front_application" {
  source = "terraform-aws-modules/s3-bucket/aws"
  version = "v4.1.1"

  bucket = module.label_front_app.id
  acl    = "private"

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

}


resource "aws_s3_bucket_policy" "cloudfront_s3_bucket_policy" {
  bucket = module.front_application.s3_bucket_id
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
  {
    "Sid": "AddPerm",
    "Effect": "Allow",
    "Principal": "*",
    "Action": "s3:GetObject",
    "Resource": "arn:aws:s3:::${module.front_application.s3_bucket_id}/*"
  }
  ]
  })
}