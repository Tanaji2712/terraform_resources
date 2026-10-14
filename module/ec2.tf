resource "aws_instance" "servers" {
  count                       = var.instance_count
  ami                         = var.ami_id #Ubuntu 24.04 LTS AMI image
  key_name                     = "my-terra-key"
  instance_type               = var.instance_type
  vpc_security_group_ids      = var.security_group_ids #Security group to allow SSH access
  subnet_id                   = var.subnet_id          #Subnet to launch the instance in
  associate_public_ip_address = true
  tags = {
    Name = "${var.my_env}-terra-server"
  }
}