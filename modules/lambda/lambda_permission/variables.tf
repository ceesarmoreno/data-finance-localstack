variable event_rule_arn {
    type = string
    default = "00000"
    description = "Role ARN of event rule"
}

variable lambda_function_name {
    type = string
    description = "Lambda function name"
}
