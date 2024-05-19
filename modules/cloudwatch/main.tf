# ----------------Label---------------- #
module "label" {
    source  = "cloudposse/label/null"
    version = "0.25.0"
    context = var.context
}
# ----------------Label---------------- #

# ----------------function---------------- #
module "label_get_all_authors" {
   source  = "cloudposse/label/null"
   version = "0.25.0"
   context = module.label.context
   name = "get-all-authors"
}
# ----------------function---------------- #

module "label_get_all_courses" {
  source   = "cloudposse/label/null"
  version = "0.25.0"
  context = module.label.context
  name = "get-all-courses"
}

module "label_update_course" {
  source   = "cloudposse/label/null"
  version = "0.25.0"
  context = module.label.context
  name = "update-course"
}

module "label_save_course" {
  source   = "cloudposse/label/null"
  version = "0.25.0"
  context = module.label.context
  name = "save-course"
}

module "label_get_course" {
  source   = "cloudposse/label/null"
  version = "0.25.0"
  context = module.label.context
  name = "get-course"
}

module "label_delete_course" {
  source   = "cloudposse/label/null"
  version = "0.25.0"
  context = module.label.context
  name = "delete-course"
}

resource "aws_cloudwatch_log_group" "get_all_authors" {
  name = module.label_get_all_authors.id
  tags = module.label_get_all_authors.tags
  retention_in_days = 90
}

resource "aws_cloudwatch_log_group" "get_all_courses" {
  name = "aws/lambda/${module.label_get_all_courses.id}"
  tags = module.label_get_all_courses.tags
  retention_in_days = 90
}

resource "aws_cloudwatch_log_group" "update_course" {
  name = "aws/lambda/${module.label_update_course.id}"
  tags = module.label_update_course.tags
  retention_in_days = 90
}

resource "aws_cloudwatch_log_group" "save_course" {
  name = "aws/lambda/${module.label_save_course.id}"
  tags = module.label_save_course.tags
  retention_in_days = 90
}

resource "aws_cloudwatch_log_group" "get_course" {
  name = "aws/lambda/${module.label_get_course.id}"
  tags = module.label_get_course.tags
  retention_in_days = 90
}

resource "aws_cloudwatch_log_group" "delete_course" {
  name = "aws/lambda/${module.label_delete_course.id}"
  tags = module.label_delete_course.tags
  retention_in_days = 90
}