# ----------------Label---------------- #
module "label" {
    source  = "cloudposse/label/null"
    version = "0.25.0"
    context = var.context
}
# ----------------Label---------------- #

module "label_get_all_authors" {
   source  = "cloudposse/label/null"
   version = "0.25.0"
   context = module.label.context
   name = "get-all-authors"
}

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

data "aws_iam_policy_document" "lambda_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "get_all_authors" {
  name               = module.label_get_all_authors.id
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy.json
}

resource "aws_iam_role" "get_all_courses" {
  name               = module.label_get_all_courses.id
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy.json
}

resource "aws_iam_role" "update_course" {
  name               = module.label_update_course.id
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy.json
}

resource "aws_iam_role" "save_course" {
  name               = module.label_save_course.id
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy.json
}

resource "aws_iam_role" "get_course" {
  name               = module.label_get_course.id
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy.json
}

resource "aws_iam_role" "delete_course" {
  name               = module.label_delete_course.id
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "get_all_authors" {
  role       = aws_iam_role.get_all_authors.name
  policy_arn = module.iam_policy.arn
}

resource "aws_iam_role_policy_attachment" "get_all_courses" {
  role       = aws_iam_role.get_all_courses.name
  policy_arn = module.iam_policy_courses.arn
}

resource "aws_iam_role_policy_attachment" "update_course" {
  role       = aws_iam_role.update_course.name
  policy_arn = module.iam_policy_update_course.arn
}

resource "aws_iam_role_policy_attachment" "save_course" {
  role       = aws_iam_role.save_course.name
  policy_arn = module.iam_policy_save_course.arn
}

resource "aws_iam_role_policy_attachment" "get_course" {
  role       = aws_iam_role.get_course.name
  policy_arn = module.iam_policy_get_course.arn
}

resource "aws_iam_role_policy_attachment" "delete_course" {
  role       = aws_iam_role.delete_course.name
  policy_arn = module.iam_policy_delete_course.arn
}