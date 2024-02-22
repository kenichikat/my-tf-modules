variable "s3_bucket_name" {
  description = "The name of the S3 bucket to store the Terraform state file"
  type        = string
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table to store the Terraform state lock"
  type        = string
}
