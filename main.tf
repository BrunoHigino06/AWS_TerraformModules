resource "random_password" "db_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_db_instance" "db_instance" {
    count                   = length(var.db_instance)      
    allocated_storage       = var.db_instance[count.indes].allocated_storage
    db_name                 = var.db_instance[count.indes].db_name
    engine                  = var.db_instance[count.indes].engine
    engine_version          = var.db_instance[count.indes].engine_version
    instance_class          = var.db_instance[count.indes].instance_class
    username                = var.db_instance[count.indes].username
    password                = random_password.db_password.result
    parameter_group_name    = var.db_instance[count.indes].parameter_group_name
    skip_final_snapshot     = var.db_instance[count.indes].skip_final_snapshot
    tags                    = merge(
                              var.db_instance[count.indes].tags,
        {name               = var.db_instance[count.index].name}
    )
}