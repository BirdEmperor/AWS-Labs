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
# ----------------fuinction---------------- #

# ----------------Lambda---------------- #
module "lambda_function" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "7.4.0"

  function_name = module.label_get_all_authors.id
  description   = "My awesome lambda function"
  handler       = "index.handler"
  runtime       = "nodejs16.x"

  environment_variables = {
    TABLE_NAME = var.table_authors_name
  }

  # source_path   = "modules/lambda/src/get_all_authors"
  source_path   = "${path.module}/src/get_all_authors"

  tags = module.label_get_all_authors.tags
}
# ----------------Lambda---------------- #