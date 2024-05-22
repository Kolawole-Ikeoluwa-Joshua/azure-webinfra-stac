# --- key_vault/variables.tf ---

variable "location" {
  description = "The Azure region where the resources will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "tenant_id" {
  description = "The tenant ID"
  type        = string
}

variable "admin_object_id" {
  description = "The admin user object ID"
  type        = string
}

variable "key_vault_name" {
  description = "The name of the Azure Key Vault"
  type        = string
}