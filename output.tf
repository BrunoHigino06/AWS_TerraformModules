output "transit_gateway_attachment_id" {
  value = aws_ec2_transit_gateway_vpc_attachment.transit_gateway_vpc_attachment[*].id
  description = "id of the transit gateway attachment"
}