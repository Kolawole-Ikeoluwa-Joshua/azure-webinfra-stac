# --- nsg/variables.tf ---
variable "location" {
  description = "The Azure region where the resources will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "web_tier_subnet_prefix" {
  description = "The address prefix for the web tier subnet"
  type        = string
}

variable "db_tier_subnet_prefix" {
  description = "The address prefix for the database tier subnet"
  type        = string
}
