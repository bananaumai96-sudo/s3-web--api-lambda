resource "aws_lambda_function" "lambda" {
  function_name = var.modules_name
  role          = var.modules_role_arn
  handler       = var.modules_handler
  runtime       = var.modules_runtime
  filename      = var.modules_filename
    source_code_hash = filebase64sha256("${var.modules_filename}")
}
