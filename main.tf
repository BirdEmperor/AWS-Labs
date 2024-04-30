resource "aws_s3_bucket" "this" {
  bucket = "851725351589-my-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}