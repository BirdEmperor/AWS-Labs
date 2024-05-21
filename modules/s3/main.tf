locals {
  tag_name = var.use_local ? "TFBucketGooseMark" : var.bucket_name
}

resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  tags = {
    Name        = local.tag_name
    Environment = "Dev"
  }
}
