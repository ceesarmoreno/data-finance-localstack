#SOBE ARQUIVOS ZIP PARA O S3 EM CASO VERDADEIRO
resource "aws_s3_object" "lambda_content_zip" {
  bucket = var.lambda_bucket_location
  key = var.lambda_key_bucket
  source = var.lambda_source_path
}

#CRIA A LAMBDA 
resource "aws_lambda_function" "lambda" {
    function_name = var.lambda_function_name
    s3_bucket = var.lambda_bucket_location
    s3_key = aws_s3_object.lambda_content_zip.key
    handler = "app.lambda_handler"
    runtime = "python3.8"
    role = var.lambda_role_arn

    source_code_hash = filebase64sha256(var.lambda_source_path) #USADO PARA VER SE O ARQUIVO TEVE ALGUMA ALTERAÇÃO

    depends_on = [aws_s3_object.lambda_content_zip]
  
}