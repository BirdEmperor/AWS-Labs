module "notification_label" {
  source  = "cloudposse/label/null"
  version = "0.25.0"
  context = module.label.context
  name    = "notification"
}


module "notify_slack" {
  source  = "terraform-aws-modules/notify-slack/aws"
  version = "5.6.0"
  lambda_function_name = "${module.notification_label.id}"
  sns_topic_name = module.notification_label.id

  slack_webhook_url = var.slack_webhook_url
  slack_channel     = "aws-notification"
  slack_username    = "reporter"
}

resource "aws_sns_topic_subscription" "email" {
  topic_arn = module.notify_slack.slack_topic_arn
  protocol  = "email"
  endpoint  = var.slack_email
}

