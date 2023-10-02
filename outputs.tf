output "bucket_name" {
  description = "bucket for static web site"
  value = module.terrahouse_aws.bucket_name
}

output "s3_website_endpoint" {
  value = module.terrahouse_aws.website_endpoint
}

output "cloudfront_url" {
  description = "the cloudfront distribution domain name"
  value = module.terrahouse_aws.cloudfront_url
}