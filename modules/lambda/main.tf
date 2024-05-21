# ----------------Label---------------- #
module "label" {
    source  = "cloudposse/label/null"
    version = "0.25.0"
    context = var.context
}

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

module "label_get_course" {
  source   = "cloudposse/label/null"
  version = "0.25.0"
  context = module.label.context
  name = "get-course"
}

module "label_save_course" {
  source   = "cloudposse/label/null"
  version = "0.25.0"
  context = module.label.context
  name = "save-course"
}

module "label_update_course" {
  source   = "cloudposse/label/null"
  version = "0.25.0"
  context = module.label.context
  name = "update-course"
}

module "label_delete_course" {
  source   = "cloudposse/label/null"
  version = "0.25.0"
  context = module.label.context
  name = "delete-course"
}

# ----------------Lambda---------------- #
module "lambda_function_get_all_authors" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "7.4.0"

  function_name = module.label_get_all_authors.id
  description   = "Goose lambda function"
  handler       = "index.handler"
  runtime       = "nodejs16.x"

  environment_variables = {
    TABLE_NAME = var.table_authors_name
  }

  # source_path   = "modules/lambda/src/get_all_authors"
  source_path   = "${path.module}/src/get_all_authors"

  lambda_role = var.role_get_all_authors_arn

  allowed_triggers = {
    APIGatewayAny = {
      service    = "apigateway"
      source_arn = "${var.aws_api_gateway_rest_api_execution_arn}/*/*/*"
    }
  }

  use_existing_cloudwatch_log_group = true
  logging_log_group = var.logging_log_group_authors

  tags = module.label_get_all_authors.tags
}

module "lambda_function_get_all_courses" {
  source = "terraform-aws-modules/lambda/aws"
  version = "7.4.0"

  function_name = module.label_get_all_courses.id
  description   = "Goose lambda function"
  handler       = "index.handler"
  runtime       = "nodejs16.x"

  source_path = "${path.module}/src/get_all_courses"

  environment_variables = {
    TABLE_NAME = var.table_courses_name
  }

  lambda_role = var.role_get_all_courses_arn

  allowed_triggers = {
    APIGatewayAny = {
      service    = "apigateway"
      source_arn = "${var.aws_api_gateway_rest_api_execution_arn}/*/*/*"
    }
  }

  use_existing_cloudwatch_log_group = true
  logging_log_group = var.logging_log_group_courses

  tags = module.label_get_all_courses.tags
}

module "lambda_function_get_course" {
  source = "terraform-aws-modules/lambda/aws"
  version = "7.4.0"

  function_name = module.label_get_course.id
  description   = "Goose lambda function"
  handler       = "index.handler"
  runtime       = "nodejs16.x"

  source_path = "${path.module}/src/get_course"

  environment_variables = {
    TABLE_NAME = var.table_courses_name
  }

  lambda_role = var.role_get_course_arn

  allowed_triggers = {
    APIGatewayAny = {
      service    = "apigateway"
      source_arn = "${var.aws_api_gateway_rest_api_execution_arn}/*/*/*"
    }
  }

  use_existing_cloudwatch_log_group = true
  logging_log_group = var.logging_log_group_get_course

  tags = module.label_get_course.tags
}

module "lambda_function_save_course" {
  source = "terraform-aws-modules/lambda/aws"
  version = "7.4.0"

  function_name = module.label_save_course.id
  description   = "Goose lambda function"
  handler       = "index.handler"
  runtime       = "nodejs16.x"

  source_path = "${path.module}/src/save_course"

  environment_variables = {
    TABLE_NAME = var.table_courses_name
  }

  lambda_role = var.role_save_course_arn

  allowed_triggers = {
    APIGatewayAny = {
      service    = "apigateway"
      source_arn = "${var.aws_api_gateway_rest_api_execution_arn}/*/*/*"
    }
  }

  use_existing_cloudwatch_log_group = true
  logging_log_group = var.logging_log_group_save_course

  tags = module.label_save_course.tags
}

module "lambda_function_update_course" {
  source = "terraform-aws-modules/lambda/aws"
  version = "7.4.0"

  function_name = module.label_update_course.id
  description   = "Goose lambda function"
  handler       = "index.handler"
  runtime       = "nodejs16.x"

  source_path = "${path.module}/src/update_course"

  environment_variables = {
    TABLE_NAME = var.table_courses_name
  }

  lambda_role = var.role_update_course_arn

  allowed_triggers  = {
    APIGatewayAny = {
      service    = "apigateway"
      source_arn = "${var.aws_api_gateway_rest_api_execution_arn}/*/*/*"
    }
  }

  use_existing_cloudwatch_log_group = true
  logging_log_group = var.logging_log_group_update_course

  tags = module.label_update_course.tags
}

module "lambda_function_delete_course" {
  source = "terraform-aws-modules/lambda/aws"
  version = "7.4.0"

  function_name = module.label_delete_course.id
  description   = "Goose lambda function"
  handler       = "index.handler"
  runtime       = "nodejs16.x"

  source_path = "${path.module}/src/delete_course"

  environment_variables = {
    TABLE_NAME = var.table_courses_name
  }

  lambda_role = var.role_delete_course_arn

  allowed_triggers = {
    APIGatewayAny = {
      service    = "apigateway"
      source_arn = "${var.aws_api_gateway_rest_api_execution_arn}/*/*/*"
    }
  }

  use_existing_cloudwatch_log_group = true
  logging_log_group = var.logging_log_group_delete_course

  tags = module.label_delete_course.tags
}
