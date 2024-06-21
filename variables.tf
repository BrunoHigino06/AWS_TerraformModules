variable "db_instance" {
  type                      = list(object({
    name                    = string
    allocated_storage       = string
    db_name                 = string
    engine                  = string
    engine_version          = string
    instance_class          = string
    username                = string
    parameter_group_name    = string
    skip_final_snapshot     = string
    tags                    = map(string)
  }))
}