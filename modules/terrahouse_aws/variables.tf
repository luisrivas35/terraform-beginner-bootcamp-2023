variable "user_uuid" {
  type        = string
  description = "UUID of the user in a specific format (e.g., xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx)"

  validation {
    condition     = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", var.user_uuid))
    error_message = "Invalid user_uuid format. Please provide a valid UUID in the format xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx."
  }
}

variable "bucket_name" {
  description = "AWS S3 bucket name"
  type        = string

  validation {
    condition = length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63 && can(regex("^[a-zA-Z0-9.-]+$", var.bucket_name))
    error_message = "Bucket name must be between 3 and 63 characters long and must only contain letters, numbers, dots, or hyphens."
  }
}

variable "index_html_filepath" {
  type        = string
  description = "Path to the index.html file"
  
  validation {
    condition     = fileexists(var.index_html_filepath)
    error_message = "The specified index_html_filepath does not exist or is not a valid file path."
  }
}

variable "error_html_filepath" {
  type        = string
  description = "Path to the error.html file"
  
  validation {
    condition     = fileexists(var.error_html_filepath)
    error_message = "The specified error_html_filepath does not exist or is not a valid file path."
  }
}

variable "content_version" {
  description = "The content version (positive integer starting at 1)"
  type        = number
  validation {
    condition     = var.content_version > 0 && var.content_version % 1 == 0
    error_message = "Content version must be a positive integer starting at 1"
  }
}

variable "assets_path" {
  description = "Path to assets folder"
  type        = string
}