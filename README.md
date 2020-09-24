# AWS GuardDuty Email Notifications Terraform Module

This repository contains a Terraform module that sets up an SNS topic and
Eventbridge event filter for GuardDuty findings. Launching this module in your
account will allow you to receive email notifications when a GuardDuty finding
occurs.

To use, follow these steps:

1. Clone this repository.

2. `cd` into the `example/` folder.

3. Run `terraform init`.

3. If you have an existing SNS topic you want to use, update `main.tf`
   appropriately.

4. Create the resources with this command:

```
AWS_REGION=<region> AWS_PROFILE=<profile> terraform apply -var 'sns_topic=<sns-topic-name>'
```
Being sure to replace the `<region>`, `<profile>`, and `<sns-topic-name>` with
appropriate values for your account.

5. Once the resources are created, log into your AWS account and subscribe to
   the SNS topic with whatever method you wish to receive the messages.
