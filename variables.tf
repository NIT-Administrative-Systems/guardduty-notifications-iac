variable "sns_topic" {
  description = "SNS Topic Object."
  type        = object({ arn = string, name = string })
  default     = { arn = "", name = "" }
}
