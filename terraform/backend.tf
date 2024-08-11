terraform {
  backend "s3" {
    bucket = "terraform-deploy-angular-mfuentes"
    key = "state/terraform.tfstate"
    region = "us-west-2"
  }
}