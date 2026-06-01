output "aws_bucket_name" {
  value = module.aws.bucket_name
}

output "azure_storage_name" {
  value = module.azure.storage_account_name
}

output "gcp_bucket_name" {
  value = module.gcp.bucket_name
}