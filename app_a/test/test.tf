locals {
  name             = var.name
  lambda_root_path = "${path.module}/lambda"
}

# This log group would be auto-created, but by explicitly creating it
# we can set explicitly the retention.
resource "aws_cloudwatch_log_group" "this" {
  name              = "/aws/lambda/${aws_lambda_function.this.function_name}"
  retention_in_days = 30
}

data "archive_file" "this" {
  type        = "zip"
  source_dir  = "${local.lambda_root_path}/dist"
  output_path = "${local.lambda_root_path}/dist/index.zip"
}

resource "aws_lambda_function" "this" {
  function_name    = local.name
  role             = var.role_arn
  filename         = data.archive_file.this.output_path
  source_code_hash = data.archive_file.this.output_base64sha256
  runtime          = "nodejs18.x"
  handler          = "index.handler"
  memory_size      = 128
  timeout          = 30

  environment {
    variables = {
      ECS_CLUSTER_NAME = var.ecs_cluster_name
      ECS_SERVICE_NAME = var.ecs_service_name
      QUEUE_URL        = var.queue_url
    }
  }

  lifecycle {
    ignore_changes = [
      filename,
      source_code_hash
    ]
  }
}

resource "aws_cloudwatch_event_rule" "this" {
  name_prefix         = "every-minute"
  schedule_expression = "rate(1 minute)"
}

resource "aws_cloudwatch_event_target" "this" {
  rule = aws_cloudwatch_event_rule.this.name
  arn  = aws_lambda_function.this.arn
}

resource "aws_lambda_permission" "this" {
  action        = "lambda:InvokeFunction"
  principal     = "events.amazonaws.com"
  function_name = aws_lambda_function.this.function_name
}

resource "aws_iam_role_policy" "this" {
  role        = var.role_id
  name_prefix = local.name

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "cloudwatch:PutMetricData",
          "ecs:DescribeTasks",
          "ecs:ListTasks",
          "sqs:GetQueueAttributes"
        ],
        "Resource" : "*"
      }
    ]
  })
}
