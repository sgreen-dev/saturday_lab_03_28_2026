output "ssm_connect_commands" {
  description = "SSM connect commands for all instances"
  value = {
    for name, instance in aws_instance.web :
    name => "aws ssm start-session --target ${instance.id}"
  }
}

output "eip_addresses" {
  description = "Elastic IP addresses for all instances"
  value = {
    for name, eip in aws_eip.web :
    name => eip.public_ip
  }
}