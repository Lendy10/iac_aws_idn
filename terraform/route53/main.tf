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

resource "aws_route53_record" "www" {
  zone_id = "Z03102443KHY48QVUVSK9" // hosted zone id
  name    = "new-timmy-7.serverless.my.id"
  type    = "A"

  alias {
    name                   = "d1i269u8v9ihg0.cloudfront.net" // retrieve from cloudfront distribution
    zone_id                = "Z2FDTNDATAQYW2"                // retrieve from cloudfront distribution
    evaluate_target_health = true
  }
}

