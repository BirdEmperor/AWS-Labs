module "iam_policy" {
    source = "terraform-aws-modules/iam/aws//modules/iam-policy"
    version = "v5.39.0"

    name        = module.label_get_all_authors.id
    path        = "/"
    description = "My example policy"

    policy = data.aws_iam_policy_document.get_all_authors.json
}

data "aws_iam_policy_document" "get_all_authors" {
  statement {
    actions = [
        "dynamodb:DeleteItem",
        "dynamodb:GetItem"        ,
        "dynamodb:PutItem",
        "dynamodb:Scan",
        "dynamodb:UpdateItem"               
    ]
    resources = [var.table_authors_arn]
  }

  statement {
    actions = [
        "logs:CreateLogStream",
        "logs:PutLogEvents"               
    ]
    resources = [
        "${var.cloudwatch_log_group_get_all_authors_arn}:*:*",
        "${var.cloudwatch_log_group_get_all_authors_arn}:*"
    ]
  }
}