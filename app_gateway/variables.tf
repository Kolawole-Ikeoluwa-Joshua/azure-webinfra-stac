# --- app_gateway/variables.tf ---

variable "location" {
  description = "The Azure region where the resources will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "web_tier_subnet_id" {
  description = "Subnet ID for the web tier"
  type        = string
}
