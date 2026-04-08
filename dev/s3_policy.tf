resource "aws_s3_bucket_policy" "frontend" {
  depends_on = [ aws_s3_bucket_public_access_block.frontend ]
  bucket = module.s3.bucket_id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = "*",
      Action = ["s3:GetObject"],
      Resource = "${module.s3.bucket_arn}/*"
    }]
  })
}
