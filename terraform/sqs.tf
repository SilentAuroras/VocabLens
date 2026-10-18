// Dead-letter queue
resource "aws_sqs_queue" "vocablens-deadletter" {
  name = "vocablens-deadletter"
}

// Dead-letter queue policy
resource "aws_sqs_queue_redrive_allow_policy" "redrive-policy" {
  queue_url = aws_sqs_queue.vocablens-deadletter.url

  // Define policy
  redrive_allow_policy = jsonencode({
    redrivePermission = "byQueue",
    sourceQueueArns   = [aws_sqs_queue.vocablens-queue.arn]
  })
}

// SQS queue for URLS to parse
resource "aws_sqs_queue" "vocablens-queue" {
  name = "vocablens-queue"

  // Define message retention
  delay_seconds = 90
  max_message_size = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10

  // Point to dead-letter queue
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.vocablens-deadletter.arn
    maxReceiveCount     = 4
  })

  // Wait for dead-letter
  depends_on = [
    aws_sqs_queue.vocablens-deadletter
  ]
}