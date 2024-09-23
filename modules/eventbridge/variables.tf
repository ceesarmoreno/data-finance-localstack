variable "event_name" {
    type = string
    description = "Name of eventbridge"
}

variable "event_cron" {
    type = string
    description = "Cron of eventbridge"
}

variable "target_arn" {
    type = string
    description = "ARN of target resource"
}


