resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket-ccn-1"
  acl    = "private"
  #force_destroy = true

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_public_access_block" "private-bucket-public-access-block" {
  bucket                  = aws_s3_bucket.b.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

provider "aws" {
  region = "us-east-1"
}
