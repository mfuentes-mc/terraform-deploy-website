module "s3_bucket" {
  source      = "../../modules/s3"
  bucket-name = "angular-website-terrafor10"
  environment = "qa"
}
