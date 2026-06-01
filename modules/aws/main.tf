resource "aws_s3_bucket" "bucket" {
  bucket = "devops-multicloud-aws-${random_id.suffix.hex}"
  tags = {
    Environment = "lab"
    ManagedBy   = "terraform"
  }
}

resource "random_id" "suffix" {
  byte_length = 4
}