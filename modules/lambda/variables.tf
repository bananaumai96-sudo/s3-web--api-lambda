variable "modules_name" {
    description = "関数名"
    type = string
}

variable "modules_role_arn" {
    description = "ロールARN"
    type = string
}

variable "modules_handler" {
    description = "LambdaHandler"
    type = string
}

variable "modules_runtime" {
    description = "ランタイム"
    type = string
}

variable "modules_filename" {
    description = "コードのファイル名(zipファイル)"
    type = string
}
