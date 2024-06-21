resource "aws_db_subnet_group" "db_subnet_group" {
    count       = length(var.db_subnet_group)       
    name        = var.db_subnet_group[count.index].name
    subnet_ids  = [for name in var.db_subnet_group[count.index].subnet_names : data.aws_subnet.subnet[name].id] 

    tags = merge(
        var.db_subnet_group[count.index].tags,
        {name = var.db_subnet_group[count.index].name}
    )
}