resource "aws_s3_bucket_website_configuration" "frontend" {
  bucket = module.s3.bucket_id

  index_document {
    suffix = "index.html"
  }
}
