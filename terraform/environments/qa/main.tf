module "s3_bucket" {
  source      = "../../modules/s3"
  bucket-name = "angular-website-terraform8"
  environment = "qa"
}
