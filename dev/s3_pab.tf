resource "aws_s3_bucket_public_access_block" "frontend" {
  bucket = module.s3.bucket_id

  block_public_acls   = false
  block_public_policy = false
  restrict_public_buckets = false
}
