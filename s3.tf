# Bucket
resource "aws_s3_bucket" "dev-bucket-2026" {
  bucket = "dev-env-bucket-2026"

  tags = {
    Name = "dev-env-bucket-2026"
  }
}