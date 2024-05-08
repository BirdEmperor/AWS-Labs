resource "aws_dynamodb_table" "this" {
    name           = var.table_name
    read_capacity  = 20
    write_capacity = 20
    hash_key       = "id"

    attribute {
      name = "id"
      type = "S"
    }
}