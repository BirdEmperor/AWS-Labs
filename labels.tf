# ----------------Label---------------- #
module "label" {
    source      = "cloudposse/label/null"
    version     = "0.25.0"

    label_order = var.label_order
    environment = var.environment
    namespace   = var.namespace
    stage       = var.stage
    delimiter   = "-"

    # id_length_limit = 15
}
# ----------------Label---------------- #

# ----------------Label_S3---------------- #
module "label_s3" {
    source  = "cloudposse/label/null"
    version = "0.25.0"

    context = module.label.context

    name    = "s3"

    tags   = {
        Name        = local.tag_name
        Environment = "Stage"
    }
}
# ----------------Label_S3---------------- #