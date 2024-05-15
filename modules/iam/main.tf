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