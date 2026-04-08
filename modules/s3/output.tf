output "bucket_name" {
    description = "バケット名"
    value = aws_s3_bucket.create.id
}

output "bucket_arn" {
    description = "バケットARN"
    value = aws_s3_bucket.create.arn
}


output "bucket_id" {
    description = "バケットID"
    value = aws_s3_bucket.create.id
}
