output "my_ec2_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.servers.public_ip
}

output "my_dynamodb_table_name" {
  description = "Name of the DynamoDB table"
  value       = aws_dynamodb_table.my_table.name
}
