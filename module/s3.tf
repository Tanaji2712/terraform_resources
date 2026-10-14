resource "aws_s3_bucket" "dev-bucket-2026" {
  bucket = "${var.my_env}-env-bucket-2026"
  tags = {
    Name        = "${var.my_env}-env-bucket-2026"
    environment = var.my_env
  }
}