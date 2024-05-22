# --- vms/variables.tf ---

variable "location" {
  description = "The Azure region where the resources will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the VMs"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the VMs"
  type        = string
  sensitive   = true
}

variable "web_tier_subnet_id" {
  description = "Subnet ID for the web tier"
  type        = string
}

variable "db_tier_subnet_id" {
  description = "Subnet ID for the database tier"
  type        = string
}
