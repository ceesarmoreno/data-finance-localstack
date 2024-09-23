#REALIZA A INSCRIÇÃO NO TÓPICO
resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = var.sns_topic_arn 
  protocol  = var.protocol 
  endpoint  = var.endpoint
}