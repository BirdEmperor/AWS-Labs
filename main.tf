locals {
  tag_name = var.use_local ? "TFBucketGooseMark" : var.bucket_name
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = "${data.aws_caller_identity.current.account_id}-my-tf-test-bucket-module"
  use_local   = true
}

module "table_authors" {
  source  = "./modules/dynamodb"
  context = module.label.context
  name    = "authors"
}

module "table_courses" {
  source  = "./modules/dynamodb"
  context = module.label.context
  name    = "courses"
}

resource "aws_s3_bucket" "this" {
  bucket = module.label_s3.id
  tags   = module.label_s3.tags
}