resource "aws_apigatewayv2_route" "get" {
for_each = toset(local.routes)
  api_id    = module.api.api_id
  route_key = each.value
  target    = "integrations/${aws_apigatewayv2_integration.lambda.id}"
}
