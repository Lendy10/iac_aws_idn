terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.83.1"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_s3_bucket" "default" {
  bucket = "new-timmy-7.serverless.my.id"
}

resource "aws_s3_bucket_website_configuration" "default" {
  bucket = aws_s3_bucket.default.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

output "bucket_website_domain" {
  value = aws_s3_bucket_website_configuration.default.website_domain
}

output "bucket_zone_id" {
  value = aws_s3_bucket.default.hosted_zone_id
}

resource "aws_s3_bucket_ownership_controls" "default" {
  bucket = aws_s3_bucket.default.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.default.id

  block_public_acls       = false
  ignore_public_acls      = false
  block_public_policy     = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_acl" "default" {
  depends_on = [
    aws_s3_bucket_ownership_controls.default,
    aws_s3_bucket_public_access_block.public_access_block
  ]

  bucket = aws_s3_bucket.default.id
  acl    = "public-read"
}

resource "aws_s3_bucket_cors_configuration" "default" {
  bucket = aws_s3_bucket.default.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }
}

resource "aws_s3_bucket_policy" "public_read_access" {
  bucket = aws_s3_bucket.default.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
   "Principal": "*",
      "Action": [ "s3:GetObject" ],
      "Resource": [
        "${aws_s3_bucket.default.arn}",
        "${aws_s3_bucket.default.arn}/*"
      ]
    }
  ]
}
EOF
}
