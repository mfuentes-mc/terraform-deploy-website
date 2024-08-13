terraform {
  backend "s3" {
    bucket = "terraform-deploy-angular-state-qa"
    key = "state/terraform.tfstate"
    region = "us-west-2"
  }
}