# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "s3" {
    bucket  = "bucket-new-timmy-idn"
    encrypt = true
    key     = "./terraform.tfstate"
    region  = "ap-southeast-1"
  }
}
