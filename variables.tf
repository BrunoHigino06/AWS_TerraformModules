# internet_gateway vars
variable "internet_gateway" {
  type       = list(object({
    name     = string
    vpc_name = string
    tags     = map(string)
  }))
  description = "Internet gateway variables"
  default     = null
}