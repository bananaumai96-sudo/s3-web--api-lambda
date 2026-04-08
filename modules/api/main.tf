resource "aws_apigatewayv2_api" "api" {
  name          = "serverless-http-api"
  protocol_type = var.modules_api_protocol
  cors_configuration {
  allow_origins = ["http://api-lambda-test-0001.s3-website-ap-northeast-1.amazonaws.com"]
  allow_methods = ["GET", "POST", "OPTIONS"]
  allow_headers = ["Content-Type"]
}

}
