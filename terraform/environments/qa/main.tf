module "s3_bucket" {
  source      = "../../modules/s3"
  bucket-name = "angular-website-terrafor9"
  environment = "qa"
}
