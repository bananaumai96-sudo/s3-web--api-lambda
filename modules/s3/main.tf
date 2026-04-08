# --- S3バケット作成 ---
resource "aws_s3_bucket" "create" {
  bucket   = var.s3_bucket_name
  tags  =   { Name = "s3-lambda" }
}
