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

resource "aws_cloudwatch_log_group" "get_all_authors" {
  name = module.label_get_all_authors.id
  tags = module.label_get_all_authors.tags
  retention_in_days = 90
}