module "dev-app" {
  source             = "./module"
  my_env             = "dev"
  ami_id             = "ami-006f82a1d5a27da54"
  key_name           = "my-terra-key"
  subnet_id          = aws_subnet.public.id
  security_group_ids = [aws_security_group.allow_ssh.id]
  instance_type      = "t3.micro"
  instance_count     = 1
  table_name         = "dev-my-table"
}

module "prod-app" {
  source             = "./module"
  my_env             = "prod"
  ami_id             = "ami-006f82a1d5a27da54"
  key_name           = "my-terra-key"
  subnet_id          = aws_subnet.public.id
  security_group_ids = [aws_security_group.allow_ssh.id]
  instance_type      = "m7i-flex.large"
  instance_count     = 2
  table_name         = "prod-my-table"
}

module "staging-app" {
  source             = "./module"
  my_env             = "staging"
  ami_id             = "ami-006f82a1d5a27da54"
  key_name           = "my-terra-key"
  subnet_id          = aws_subnet.public.id
  security_group_ids = [aws_security_group.allow_ssh.id]
  instance_type      = "t3.small"
  instance_count     = 1
  table_name         = "staging-my-table"
}