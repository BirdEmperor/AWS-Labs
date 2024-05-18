output "lambda_authors_invoke_arn" {
  value = module.lambda_function_get_all_authors.lambda_function_invoke_arn
}

output "lambda_authors_lambda_function_name" {
  value = module.lambda_function_get_all_authors.lambda_function_name
}

output "lambda_courses_invoke_arn" {
  value = module.lambda_function_get_all_courses.lambda_function_invoke_arn
}

output "lambda_courses_lambda_function_name" {
  value = module.lambda_function_get_all_courses.lambda_function_name
}

output "lambda_update_course_invoke_arn" {
  value = module.lambda_function_update_course.lambda_function_invoke_arn
}

output "lambda_update_course_lambda_function_name" {
  value = module.lambda_function_update_course.lambda_function_name
}

output "lambda_save_course_invoke_arn" {
  value = module.lambda_function_save_course.lambda_function_invoke_arn
}

output "lambda_save_course_lambda_function_name" {
  value = module.lambda_function_save_course.lambda_function_name
}

output "lambda_delete_course_invoke_arn" {
  value = module.lambda_function_delete_course.lambda_function_invoke_arn
}

output "lambda_delete_course_lambda_function_name" {
  value = module.lambda_function_delete_course.lambda_function_name
}


output "lambda_get_course_invoke_arn" {
  value = module.lambda_function_get_course.lambda_function_invoke_arn
}

output "lambda_get_course_lambda_function_name" {
  value = module.lambda_function_get_course.lambda_function_name
}