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

resource "aws_cloudfront_distribution" "s3_distribution" {
  //for my bucket
  origin {
    domain_name = "new-timmy-7.serverless.my.id.s3-website-ap-southeast-1.amazonaws.com"
    origin_id   = "bucketNewTimmy7"

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
    }
  }

  //for default bucket
  origin {
    domain_name = "bucket-new-timmy-idn.s3.amazonaws.com"
    origin_id   = "bucket-new-timmy-idn"

    s3_origin_config {
      origin_access_identity = "origin-access-identity/cloudfront/E1F582PYNPZWJ3"
    }
  }

  enabled             = true
  default_root_object = "web/index.html"

  aliases = ["new-timmy-7.serverless.my.id"]
  comment = "CloudFront distribution for S3 bucket pointing to bucket-new-timmy-idn"

  ordered_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "bucketNewTimmy7"
    path_pattern     = "/web/*"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 0
    max_ttl                = 0
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "bucket-new-timmy-idn"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 0
    max_ttl                = 0
  }

  viewer_certificate {
    acm_certificate_arn      = "arn:aws:acm:us-east-1:166190020492:certificate/1119d63b-db83-4afb-b726-4a8944f6ec7f"
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}

output "domain_name" {
  value = aws_cloudfront_distribution.s3_distribution.domain_name
}

output "hosted_zone_id" {
  value = aws_cloudfront_distribution.s3_distribution.hosted_zone_id
}
