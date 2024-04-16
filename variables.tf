variable "lambda_function" {
  type = list(object({
    function_name                       = string
    role                                = string
    filename                            = optional(string)
    architectures                       = optional(string)
    code_signing_config_arn             = optional(string)
    target_arn                          = optional(string)
    description                         = optional(string)
    env_variables                       = optional(list(string))
    ephemeral_storage_size              = optional(string)
    file_system_config_arn              = optional(string)
    file_system_config_local_mount_path = optional(string)
    handler                             = optional(string)
  }))
}