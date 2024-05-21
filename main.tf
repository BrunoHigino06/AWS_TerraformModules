resource "aws_instance" "ec2_instance" {
    count = length(var.ec2_instance)
    ami           = var.ec2_instance[count.index].ami
    instance_type = var.ec2_instance[count.index].instance_type
    associate_public_ip_address = var.ec2_instance[count.index].associate_public_ip_address
    availability_zone = var.ec2_instance[count.index].availability_zone
    ebs_block_device {
      
    }


    tags = merge(
        var.ec2_instance[count.index].tags,
        {Name = var.ec2_instance[count.index].name}
    )
}