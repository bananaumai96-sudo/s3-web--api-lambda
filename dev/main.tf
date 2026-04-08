# --- Lambda用ロール作成 ---
module "role" {
    source                       = "../modules/iam_lambda"
    modules_lambda_policy_arn    = var.policy_arn
    modules_lambda_db_policy_arn = var.db_policy_arn
}

# --- Lambda関数作成 ---
module "lambda" {
    source                = "../modules/lambda"
    modules_name          = var.name
    modules_role_arn      = module.role.lambda_role_arn
    modules_handler       = var.handler
    modules_runtime       = var.runtime
    modules_filename      = var.filename
}

# --- S3作成 ---
module "s3" {
  source         = "../modules/s3"
  s3_bucket_name = var.bucket_name
}

# --- API Gateway作成 ---
module "api" {
  source = "../modules/api"
  modules_api_protocol = var.api_protocol
}

# --- DynaoDB作成 ---
module "DynamoDB" {
  source = "../modules/dynamodb"
  modules_db_billing_mode = var.db_billing_mode
  modules_db_hash_key = var.db_hash_key
  modules_db_key_type = var.db_key_type
  modules_db_gsi_hash_key = var.db_gsi_hash_key
  modules_db_gsi_key_type = var.db_gsi_key_type
  modules_db_gsi_name = var.db_gsi_name
  modules_db_gsi_projection_type = var.db_gsi_projection_type
}
