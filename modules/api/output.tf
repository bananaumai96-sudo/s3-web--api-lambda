output "api_url" {
  description = "api_url"
  value = aws_apigatewayv2_api.api.api_endpoint
}

output "api_id" {
  description = "api_id"
  value = aws_apigatewayv2_api.api.id
}