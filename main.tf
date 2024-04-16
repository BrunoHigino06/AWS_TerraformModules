resource "aws_lambda_function" "lambda_function" {
  count                     = length(var.lambda_function)
  filename                  = var.lambda_function[count.index].filename
  function_name             = var.lambda_function[count.index].function_name
  role                      = var.lambda_function[count.index].role
  architectures             = var.lambda_function[count.index].architectures
  code_signing_config_arn   = var.lambda_function[count.index].code_signing_config_arn
  dead_letter_config {
    target_arn              = var.lambda_function[count.index].target_arn
  }
  description               = var.lambda_function[count.index].description
  dynamic "environment" {
    for_each                = var.lambda_function[count.index].env_variables != null ? var.lambda_function[count.index].env_variables : {}
    content {
      variables             = {
        for key, value in environment.value : key => value
      }
    }
  }
  ephemeral_storage {
    size = var.lambda_function[count.index].ephemeral_storage_size
  }
  file_system_config {
    arn = var.lambda_function[count.index].file_system_config_arn
    local_mount_path = var.lambda_function[count.index].file_system_config_local_mount_path
  }
  handler                   = var.lambda_function[count.index].handler
  image_config {
    continue from here?!!!
  }
  source_code_hash          = data.archive_file.lambda.output_base64sha256
  runtime                   = "nodejs18.x"
}