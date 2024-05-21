variable "table_authors_arn" {
    type = string
}

variable "table_courses_arn" {
  type = string
}

variable "cloudwatch_log_group_get_all_authors_arn" {
    type = string
}

variable "cloudwatch_log_group_get_all_courses_arn" {
  type = string
}

variable "cloudwatch_log_group_update_course_arn" {
  type = string
}

variable "cloudwatch_log_group_save_course_arn" {
  type = string
}

variable "cloudwatch_log_group_get_course_arn" {
  type = string
}

variable "cloudwatch_log_group_delete_course_arn" {
  type = string
}
