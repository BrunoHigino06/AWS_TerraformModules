resource "aws_internet_gateway" "internet_gateway" {
  count = length(var.internet_gateway)
  vpc_id = data.aws_vpc.data_vpc_id[var.internet_gateway[count.index].vpc_name].id

  tags = merge(var.internet_gateway[count.index].tags,
    {Name = var.internet_gateway[count.index].name}
  )
}