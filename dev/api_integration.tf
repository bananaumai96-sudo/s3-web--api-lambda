resource "aws_apigatewayv2_integration" "lambda" {
  api_id                 = module.api.api_id
  integration_type       = "AWS_PROXY"
  integration_uri        = module.lambda.lamubda_function_invoke
  integration_method     = "POST"
  payload_format_version = "2.0"
}
