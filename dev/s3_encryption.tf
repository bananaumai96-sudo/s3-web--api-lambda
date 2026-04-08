# --- S3バケット暗号化 ---
resource "aws_s3_bucket_server_side_encryption_configuration" "frontend" {
  bucket   = module.s3.bucket_id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
