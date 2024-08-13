//Para un bucket de S3 que se quiere configurar para 
//desplegar una app web y servirla como una pagina estatica
//se deben de considerar los siguientes puntos
//1. el bucket que se va a utilizar
//2. La configuracion del bucket como un website
//3. manejar el acceso publico del bucket
//4. Manejar quien es el propietario del bucket
//5. La politica del bucket 

//1.se crear el recurso s3 con el bucket de acuerdo al 
//que se definio en las variables
data "aws_s3_bucket" "existing_bucket" {
  bucket = "angular-website-fixed-name"
}

resource "aws_s3_bucket" "angular_app_bucket" {
  count  = length(data.aws_s3_bucket.existing_bucket.id) > 0 ? 0 : 1
  bucket = "angular-website-fixed-name"
}
//2.Provides an S3 bucket website configuration resource. For more information
resource "aws_s3_bucket_website_configuration" "angular_app_bucket_website" {
  bucket = aws_s3_bucket.angular_app_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

//3.Manages S3 bucket-level Public Access Block configuration

resource "aws_s3_bucket_public_access_block" "angular_app_bucket_public_access_block" {
  bucket = aws_s3_bucket.angular_app_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

//4. Propiedad del bucket S3

resource "aws_s3_bucket_ownership_controls" "angular_app_bucket_ownership_controls" {
  bucket = aws_s3_bucket.angular_app_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
  depends_on = [aws_s3_bucket_public_access_block.angular_app_bucket_public_access_block]
}

//5. Politica del bucket

resource "aws_s3_bucket_policy" "angular_app_bucket_policy" {
  bucket = aws_s3_bucket.angular_app_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.angular_app_bucket.arn}/*"
      }
    ]
  })

  depends_on = [
    aws_s3_bucket.angular_app_bucket,
    aws_s3_bucket_public_access_block.angular_app_bucket_public_access_block,
    aws_s3_bucket_ownership_controls.angular_app_bucket_ownership_controls
  ]
}


