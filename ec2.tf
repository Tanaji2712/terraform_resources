resource "aws_key_pair" "deployer" {
  key_name   = "my-terra-key"
  public_key = file("/mnt/c/Users/Admin/OneDrive/Desktop/terraform_resources/terra-key.pub")
}

# security group
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "This will Allow SSH inbound traffic for instances"
  vpc_id      = aws_vpc.default.id #Interpolation to get the default VPC ID
  #Incomming traffic rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  #Outgoing traffic rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "servers" {
  ami                         = "ami-006f82a1d5a27da54" #Ubuntu 24.04 LTS AMI image
  key_name                    = aws_key_pair.deployer.key_name
  instance_type               = "t3.micro"
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id] #Security group to allow SSH access
  subnet_id                   = aws_subnet.public.id              #Subnet to launch the instance in
  associate_public_ip_address = true
  tags = {
    Name = "dev-terra-server"
  }
}