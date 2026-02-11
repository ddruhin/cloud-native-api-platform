# observability.tf - Production Observability
resource "aws_cloudwatch_dashboard" "poc_dashboard" {
  dashboard_name = "poc-golden-signals"
  
  dashboard_body = jsonencode({
    widgets = [
      {
        type = "metric"
        properties = {
          metrics = [
            ["AWS/ApiGateway", "Latency", "ApiName", "poc_api", { stat: "p95" }],
            [".", "Count", ".", ".", { stat: "Sum", color: "#00ff00" }],
            ["AWS/Lambda", "Duration", "FunctionName", "poc-orders-lambda", { stat: "p95" }],
            [".", "Errors", ".", ".", { stat: "Sum", color: "#ff0000" }]
          ]
          period            = 60
          title             = "Golden Signals"
          view              = "timeSeries"
          stacked           = false
          region            = "us-east-1"
          setPeriodToTimeRange = true
        }
      }
    ]
  })
}

resource "aws_cloudwatch_metric_alarm" "high_error_rate" {
  alarm_name          = "poc-api-high-error-rate"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "5XXError"
  namespace           = "AWS/ApiGateway"
  period              = "60"
  statistic           = "Sum"
  threshold           = "10"
  alarm_description   = "API error rate > 5%"
  alarm_actions       = []  # Add SNS later
}
