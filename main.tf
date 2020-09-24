resource "aws_cloudwatch_event_rule" "main" {
  name          = "guardduty-finding-events"
  description   = "AWS GuardDuty event findings"
  event_pattern = file("${path.module}/event-pattern.json")
}

# More details about the response syntax can be found here:
# https://docs.aws.amazon.com/guardduty/latest/ug/get-findings.html#get-findings-response-syntax
resource "aws_cloudwatch_event_target" "mail" {

  rule      = aws_cloudwatch_event_rule.main.name
  target_id = "send-to-sns"
  arn       = var.sns_topic.arn

  input_transformer {
    input_paths = {
      title         = "$.detail.title"
      description   = "$.detail.description"
      eventTime     = "$.detail.service.eventFirstSeen"
      region        = "$.detail.region"
      severity      = "$.detail.severity"
      finding_type  = "$.detail.type"
      finding_id    = "$.detail.id"
      account_id    = "$.detail.accountId"
    }

    input_template = file("${path.module}/input-template.txt")
  }
}
