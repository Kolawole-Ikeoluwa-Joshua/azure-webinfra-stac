# --- sql_database/variables.tf ---

variable "location" {
  description = "The Azure region where the resources will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the SQL server"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the SQL server"
  type        = string
  sensitive   = true
}
