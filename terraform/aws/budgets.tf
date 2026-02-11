resource "aws_budgets_budget" "poc_budget" {
name = "monthly-poc-budget"
budget_type = "COST"
limit_amount = "20"
limit_unit = "USD"
time_unit = "MONTHLY"

notification {
comparison_operator = "GREATER_THAN"
threshold = 50
threshold_type = "PERCENTAGE"
notification_type = "ACTUAL"
subscriber_email_addresses = ["DruhinDhavala@gmail.com"]
}
}