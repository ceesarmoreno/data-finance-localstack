output "lambda_name" {
    description = "Name of lambda function"
    value = aws_lambda_function.lambda.function_name
}

output "lambda_arn" {
    description = "ARN of lambda function"
    value = aws_lambda_function.lambda.arn
}