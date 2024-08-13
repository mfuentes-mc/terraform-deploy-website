module "s3_bucket" {
  source      = "../../modules/s3"
  bucket-name = "angular-website-terrafor12"
  environment = "qa"
}
