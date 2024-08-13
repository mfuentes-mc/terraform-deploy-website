terraform {
  backend "s3" {
    bucket = "terraform-deploy-angular-state-dev"
    key = "state/terraform.tfstate"
    region = "us-west-2"
  }
}