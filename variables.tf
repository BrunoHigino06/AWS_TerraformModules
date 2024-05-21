variable "ec2_instance" {
  type = list(object({
    name = string
    tags = map(string)
    instance_type = string
    ami     = optional(string)
    associate_public_ip_address = optional(string)
    availability_zone = optional(string)
    
  }))
}