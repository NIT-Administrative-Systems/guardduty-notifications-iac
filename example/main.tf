resource "aws_sns_topic" "topic" {
  name = var.sns_topic
  tags = local.tags
}

module "guardduty-notifications" {
  source = "../"

  sns_topic = aws_sns_topic.topic
}
