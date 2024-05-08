locals {
  tag_name = var.use_local ? "TFBucketGooseMark" : var.bucket_name
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = "851725351589-my-tf-test-bucket-module"
  use_local   = true
}

module "table_authors" {
  source     = "./modules/dynamodb"
  table_name = "authors"
}

module "table_courses" {
  source     = "./modules/dynamodb"
  table_name = "courses"
}

resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  tags   = {
    Name        = local.tag_name
    Environment = "Dev"
  }
}