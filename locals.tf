locals {
    kms_names = {
        kms_bucket = "kms-bucket"
        kms_sns = "kms-sns"
        kms_sqs = "kms-sqs"
    }

    buckets_names = {
        bucket_artifact = "artifact"
        bucket_bronze = "data-bronze"
        bucket_silver = "data-silver"
        bucket_gold = "data-gold"
    }

    lambda_names = {
        lambda_bronze = "lambda-ingt-bronze"
        lambda_silver = "lambda-tran-silver"
    }

    sns_names = {
        sns_integration = "sns-integration"
    }

    role_creates = merge(local.lambda_names)


    eventbridge_create = {
        event_lambda_bronze = {
        name = "event-lambda-ingt-bronze"
        cron = "rate(1 minute)"
        }

        event_lambda_silver = {
        name = "event-lambda-tran-silver"
        cron = "rate(55 minutes)"
        }
    }

    sqs_names = {
        sqs_integration = "sqs-integration"
    }

    sns_subscription = {
        subscription_sns_integration = {
            sns_name = "sns-integration"
            protocol = "sqs"
        }

    }
}