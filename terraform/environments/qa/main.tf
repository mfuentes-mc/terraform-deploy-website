module "s3_bucket" {
  source      = "../../modules/s3"
  bucket-name = "angular-website"
  environment = "qa"
}
