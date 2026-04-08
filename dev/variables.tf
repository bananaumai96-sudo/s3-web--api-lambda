# --- Lambda関数で使用 ---
variable "name" {
    description = "関数名"
    type = string
}

variable "handler" {
    description = "LambdaHandler"
    type = string
}

variable "runtime" {
    description = "ランタイム"
    type = string
}

variable "filename" {
    description = "コードのファイル名(zipファイル)"
    type = string
}

# --- ロール作成で使用 ---
variable "policy_arn" {
    description = "ロールARN"
    type = string
}

variable "db_policy_arn" {
    description = "db用ポリシーARN"
    type = string
  
}
# --- S3バケット作成で使用 ---
variable "bucket_name" {
    description = "s3バケット名"
    type = string
}


# --- AIPで使用 ---
variable "api_protocol" {
    description = "api_protocol"
    type = string
}

# --- DynamoDBで使用 ---
variable "db_billing_mode" {
    description = "billing_mode"
    type = string
}

variable "db_hash_key" {
    description = "hash_key"
    type = string
}

variable "db_key_type" {
    description = "key_type"
    type = string
}

variable "db_gsi_hash_key" {
    description = "gsi_hash_key"
    type = string
}

variable "db_gsi_key_type" {
    description = "gsi_key_type"
    type = string
}

variable "db_gsi_name" {
    description = "gsi_name"
    type = string
}

variable "db_gsi_projection_type" {
    description = "gsi_projection_type"
    type = string
}
