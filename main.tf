terraform{

}

module "terrahouse_aws" {
    source ="./modules/terrahouse_aws"
    # user_uuid ="dacbd37c-4b14-45b0-b5f0-13f0eacd8c16"
    # bucket_name ="56q40qa2vq8847w5"
    user_uuid = var.user_uuid
    bucket_name = var.bucket_name
    index_html_filepath = var.index_html_filepath
    error_html_filepath = var.error_html_filepath
}

