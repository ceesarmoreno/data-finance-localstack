variable lambda_bucket_location {
    type = string
    description = "Bucket of lambda zip location"
}

variable lambda_key_bucket {
    type = string
    description = "Key of lambda zip file"
}

variable lambda_source_path {
    type = string
    description = "Path  of lambda zip file"
}

variable lambda_function_name {
    type = string
    description = "Lambda function name"
}

variable lambda_role_arn {
    type = string
    description = "Role ARN for using in lambda"
}

