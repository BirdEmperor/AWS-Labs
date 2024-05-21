# #------terraform_bucket------#
# output "bucket_id" {
#     value = aws_s3_bucket.this.id 
# }
# output "bucket_arn" {
#     value = aws_s3_bucket.this.arn  
# }
# output "bucket_domain_name" {
#     value = aws_s3_bucket.this.bucket_domain_name
# }
# output "bucket_regional_domain_name" {
#     value = aws_s3_bucket.this.bucket_regional_domain_name
# }
# #------terraform_bucket------#

# #------module_bucket------#
# output "module_bucket_id" {
#     value = module.s3.bucket_id 
# }
# output "module_bucket_arn" {
#     value = module.s3.bucket_arn
# }
# output "module_bucket_domain_name" {
#     value = module.s3.bucket_domain_name
# }
# output "module_bucket_regional_domain_name" {
#     value = module.s3.bucket_regional_domain_name
# }
# #------module_bucket------#

# #------module_dynamodb------#
# output "courses_table_name" {
#     value = module.table_courses.id
# }
# output "courses_table_arn" {
#     value = module.table_courses.arn
# }
# #---------------------------#
# output "authors_table_name" {
#     value = module.table_authors.id
# }
# output "authors_table_arn" {
#     value = module.table_authors.arn
# }
# #------module_dynamodb------#

output "courses_table_name" {
  value = module.table_courses.id
}
output "courses_table_arn" {
  value = module.table_courses.arn
}

output "authors_table_name" {
  value = module.table_authors.id
}
output "authors_table_arn" {
  value = module.table_authors.arn
}
