#IMPRIME TODOS OS KMS
output "all_kms_alias" {
  value = [for k in keys(module.kms_key_create) : "${module.kms_key_create[k].kms_alias_name} | ${module.kms_key_create[k].kms_alias_arn}"]
}

#IMPRIME TODOS OS BUCKETS
output "all_buckets" {
  value = [for k in keys(module.bucket_create) : "${module.bucket_create[k].bucket_name} | ${module.bucket_create[k].bucket_arn}"]
}

#IMPRIME TODAS AS ROLES
output "all_roles" {
  value = [for k in keys(module.iam_create): "${module.iam_create[k].role_name} | ${module.iam_create[k].role_arn}"]
}

#IMPRIME TODAS AS LAMBDAS
output "all_lambdas" {
  value = [for k in keys(module.lambda_create): "${module.lambda_create[k].lambda_name} | ${module.lambda_create[k].lambda_arn}" ]
}

#IMPRIME TODOS OS EVENTOS (eventbridge)
output "all_events" {
  value = [for k in keys(module.eventbridge_create): "${module.eventbridge_create[k].event_rule_name} | ${module.eventbridge_create[k].event_rule_arn}" ]
}

#IMPRIME TODOS ALLOWPERMISSION LAMBDA x EVENTBRIDGE
output "all_functions_allow" {
  value = [for k in keys(module.lambda_permission): "${module.lambda_permission[k].function_allow} | ${module.lambda_permission[k].event_arn}" ]
}

#IMPRIME TODOS OS TÓPICOS SNS
output "all_sns" {
  value = [for k in keys(module.sns_create): "${module.sns_create[k].sns_topic_name} | ${module.sns_create[k].sns_topic_arn}" ]
}

#IMPRIME TODAS AS SUBSCRIPTION QUE TEVE NO TÓPICO
output "all_subs_sns" {
  value = [for k in keys(module.sns_subscription): "${module.sns_subscription[k].sub_protocol} | ${module.sns_subscription[k].sub_endpoint}" ]
}

#IMPRIME TODAS FILAS SQS
output "all_sqs" {
  value = [for k in keys(module.sqs_create): "${module.sqs_create[k].sqs_queue_name} | ${module.sqs_create[k].sqs_queue_arn} | ${module.sqs_create[k].sqs_queue_url}" ]
}

#IMPRIME TODAS FILAS DLQ SQS
output "all_dlq_sqs" {
  value = [for k in keys(module.sqs_create): "(${module.sqs_create[k].sqs_queue_dlq_name} | ${module.sqs_create[k].sqs_queue_dlq_arn} | ${module.sqs_create[k].sqs_queue_dlq_url})"]
}

