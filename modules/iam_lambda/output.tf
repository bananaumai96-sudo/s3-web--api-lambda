output "lambda_role_arn" {
    description = "ロールARN"
    value = aws_iam_role.lambda_common_role.arn
}
