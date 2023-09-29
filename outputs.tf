output "bucket_name" {
  description = "bucket for static web site"
  value = module.terrahouse_aws.bucket_name
}