variable "user_uuid" {
  type        = string
  description = "UUID of the user in a specific format (e.g., xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx)"

  validation {
    condition     = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", var.user_uuid))
    error_message = "Invalid user_uuid format. Please provide a valid UUID in the format xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx."
  }
}
