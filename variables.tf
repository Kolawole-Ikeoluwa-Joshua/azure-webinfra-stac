# --- root/variables.tf ---
variable "location" {
  description = "The location of the resources"
  default     = "North Europe"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  default     = "vtl-zenith"
}

variable "admin_username" {
  description = "Admin username for the VMs and SQL server"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the VMs and SQL server"
  type        = string
  sensitive   = true
}


variable "subscription_id" {}
variable "tenant_id" {}
variable "client_id" {}
variable "client_secret" {}   