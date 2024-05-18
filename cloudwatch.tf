module "metric_alarm" {
  source  = "terraform-aws-modules/cloudwatch/aws//modules/metric-alarms-by-multiple-dimensions"
  version = "5.3.1"

  alarm_name          = "${module.label.id}-"
  alarm_description   = "Errors in ${module.lambdas.lambda_authors_lambda_function_name}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  threshold           = 1
  period              = 60
  unit                = "Count"
  treat_missing_data = "ignore"

  namespace   = "AWS/Lambda"
  metric_name = "Errors"
  statistic   = "Sum"

  dimensions = {
    "authors" = {
      FunctionName = "${module.lambdas.lambda_authors_lambda_function_name}"
    },
    "courses" = {
      FunctionName = "${module.lambdas.lambda_courses_lambda_function_name}"
    },
  }

  alarm_actions = [module.notify_slack.slack_topic_arn]
}