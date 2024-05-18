variable "table_authors_name" {
  type = string
}

variable "table_courses_name" {
  type = string
}

variable "role_get_all_authors_arn" {
  type = string
}

variable "role_get_all_courses_arn" {
  type = string
}

variable "role_update_course_arn" {
  type = string
}

variable "role_save_course_arn" {
  type = string
}

variable "role_delete_course_arn" {
  type = string
}

variable "role_get_course_arn" {
  type = string
}

variable "aws_api_gateway_rest_api_execution_arn" {
  type = string
}

variable "logging_log_group_authors" {
  type = string
}

variable "logging_log_group_courses" {
  type = string
}

variable "logging_log_group_delete_course" {
  type = string
}

variable "logging_log_group_save_course" {
  type = string
}

variable "logging_log_group_get_course" {
  type = string
}

variable "logging_log_group_update_course" {
  type = string
}