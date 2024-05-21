variable "bucket_name" {
    type = string
    # default = "851725351589-my-tf-test-bucket"
}

variable "use_local" {
    type = bool
} 

variable "slack_webhook_url" {
  type = string
}

variable "slack_email" {
  type = string
}
