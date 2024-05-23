variable "ec2_instance" {
  type                          = list(object({
    name                        = string
    tags                        = map(string)
    instance_type               = string
    key_name                    = optional(string)
    ami                         = optional(string)
    associate_public_ip_address = optional(string)
    availability_zone           = optional(string)
    subnet_name                 = optional(string)
    security_group_name         = optional(list(string))
    user_data                   = optional(string)
    ebs_block_device            = optional(object({
      volume_size               = string
      volume_type               = string
      device_name               = string
      delete_on_termination     = optional(string)
      encrypted                 = optional(string)
      iops                      = optional(string)
      kms_key_id                = optional(string)
      snapshot_id               = optional(string)
      throughput                = optional(string)
    }))
  }))
}