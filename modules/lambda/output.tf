output "lambda_function_arn" {
    description = "Lambda関数ARN"
    value = aws_lambda_function.lambda.arn
}

output "lambda_function_name" {
    description = "Lambda関数名"
    value = aws_lambda_function.lambda.function_name
}

output "lamubda_function_invoke" {
    description = "function_invoke_arn"
    value = aws_lambda_function.lambda.invoke_arn
}
