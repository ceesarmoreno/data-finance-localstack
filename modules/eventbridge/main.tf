resource "aws_cloudwatch_event_rule" "eventrule" {
  name        = var.event_name
  description = "Event rule of ${var.event_name}"
  schedule_expression  = var.event_cron
}


resource "aws_cloudwatch_event_target" "ruletarget" {
    arn = var.target_arn 
    rule = aws_cloudwatch_event_rule.eventrule.id

depends_on = [ aws_cloudwatch_event_rule.eventrule]
}