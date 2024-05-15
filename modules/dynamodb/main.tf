# ----------------Label---------------- #
module "label" {
    source  = "cloudposse/label/null"
    version = "0.25.0"
    context = var.context
    name    = var.name
}
# ----------------Label---------------- #

resource "aws_dynamodb_table" "this" {
    name           = module.label.id
    billing_mode   = "PAY_PER_REQUEST"
    hash_key       = "id"

    attribute {
      name = "id"
      type = "S"
    }
}