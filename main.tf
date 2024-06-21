resource "random_password" "db_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_db_instance" "db_instance" {
    count                   = length(var.db_instance)      
    allocated_storage       = var.db_instance[count.index].allocated_storage
    db_name                 = var.db_instance[count.index].db_name
    engine                  = var.db_instance[count.index].engine
    engine_version          = var.db_instance[count.index].engine_version
    instance_class          = var.db_instance[count.index].instance_class
    username                = var.db_instance[count.index].username
    password                = random_password.db_password.result
    parameter_group_name    = var.db_instance[count.index].parameter_group_name
    skip_final_snapshot     = var.db_instance[count.index].skip_final_snapshot
    db_subnet_group_name    = var.db_instance[count.index].db_subnet_group_name
    tags                    = merge(
                              var.db_instance[count.index].tags,
        {name               = var.db_instance[count.index].name}
    )
}