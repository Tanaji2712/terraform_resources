variable "my_env" {
  description = "The environment for the resources"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "The key name for the EC2 instance"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID for the EC2 instance"
  type        = string
}

variable "security_group_ids" {
  description = "The security group IDs for the EC2 instance"
  type        = list(string)
}

variable "instance_count" {
  description = "The number of EC2 instances to create"
  type        = number
}
variable "table_name" {
  description = "The name of the DynamoDB table"
  type        = string
}