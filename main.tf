
#CRIA 2 KMS
module "kms_key_create" {
    source = "./modules/kms"
    for_each = local.kms_names
    kms_alias_name = each.value
}

#CRIA 4 BUCKETS E ATRELA A KMS DO S3
module "bucket_create" {
    source = "./modules/s3"
    for_each = local.buckets_names

    bucket_name = each.value
    kms_key_arn = lookup({for key, value in module.kms_key_create: value.kms_alias_name => value.kms_alias_arn}, "alias/kms-bucket", null)
    depends_on = [module.kms_key_create]
}

#CRIA DUAS ROLES PARA USO DAS LAMBDAS
module "iam_create" {
    source = "./modules/iam"
    for_each = local.role_creates

    role_name = "${each.value}-role"
    role_path = "./utils/iamsr/${each.value}-role.json"

    policy_name ="${each.value}-policy"
    policy_path = "./utils/iamsr/${each.value}-policy.json" 
}

#CRIA DUAS LAMBDA
module "lambda_create"{
    source = "./modules/lambda/lambda_create"
    for_each = local.lambda_names

    #INFOS PARA SUBIDA DO .ZIP ARQUIVO NO BUCKET
    lambda_bucket_location = lookup({for key,value in module.bucket_create: key => value.bucket_name}, "bucket_artifact",null)
    lambda_key_bucket = "${each.value}.zip"
    lambda_source_path = "./utils/lambda/${each.value}.zip"

    #INFOS DA LAMBDA
    lambda_function_name = each.value
    lambda_role_arn = lookup({for key,value in module.iam_create: value.role_name => value.role_arn}, "${each.value}-role", null)

    depends_on = [module.bucket_create, module.iam_create]
}

#CRIA EVENTBRIDGE
module "eventbridge_create" {
  source = "./modules/eventbridge"
  for_each = local.eventbridge_create

  event_name = each.value.name
  event_cron = each.value.cron
  target_arn = lookup({for key, value in module.lambda_create: value.lambda_name => value.lambda_arn}, replace(each.value.name, "event-", ""), null)

  depends_on = [ module.lambda_create ]

}

#LIBERA PERMISSÃO DO EVENTBRIDGE INVOKAR A LAMBDA
module "lambda_permission" {
    source = "./modules/lambda/lambda_permission"
    for_each = local.lambda_names
    
    lambda_function_name =  lookup({for key, value in module.lambda_create: value.lambda_name => value.lambda_name}, each.value , null)
    event_rule_arn = lookup({for key, value in module.eventbridge_create: value.event_rule_name => value.event_rule_arn}, "event-${each.value}", null)

    depends_on = [ module.lambda_create, module.eventbridge_create ]

}


#CRIA OS TOPICOS SNS
module "sns_create" {
  source = "./modules/sns/sns_create"
  for_each = local.sns_names

  sns_topic_name =  each.value
  kms_sns_arn = lookup({for key, value in module.kms_key_create: value.kms_alias_name => value.kms_alias_arn}, "alias/kms-sns", null)

  depends_on = [module.kms_key_create]

}

#CRIA AS FILAS SQS
module "sqs_create" {
  source = "./modules/sqs"
  for_each = local.sqs_names

  sqs_queue_name =  each.value
  kms_sqs_arn = lookup({for key, value in module.kms_key_create: value.kms_alias_name => value.kms_alias_arn}, "alias/kms-sqs", null)

  depends_on = [module.kms_key_create]
}


#SUBSCRIPTION SQS -> SNS 
module "sns_subscription" {
    source = "./modules/sns/sns_subscription"
    for_each = local.sns_subscription

    sns_topic_arn =  lookup({for key, value in module.sns_create: value.sns_topic_name => value.sns_topic_arn}, each.value.sns_name, null)
    protocol = each.value.protocol
    endpoint = lookup({for key, value in module.sqs_create: value.sqs_queue_name => value.sqs_queue_arn}, "sqs-integration", null)


  depends_on = [module.sns_create, module.sqs_create]
}

