resource "aws_apigatewayv2_api" "poc_api" {
  name          = "cloud-native-api-poc"
  protocol_type = "HTTP"
  
  # Inherits tags from providers.tf
}

resource "aws_apigatewayv2_stage" "poc_stage" {
  api_id      = aws_apigatewayv2_api.poc_api.id
  name        = "api"
  auto_deploy = true
}

output "api_gateway_invoke_url" {
  value = aws_apigatewayv2_stage.poc_stage.invoke_url
}
