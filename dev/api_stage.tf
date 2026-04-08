resource "aws_apigatewayv2_stage" "default" {
  api_id      = module.api.api_id
  name        = "$default"
  auto_deploy = true
}
