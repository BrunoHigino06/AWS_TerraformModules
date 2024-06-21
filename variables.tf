variable "db_subnet_group" {
  type                  = list(object({
    name                = string
    subnet_names        = list(string)
    tags                = map(string)
  }))
}