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

variable "admin_object_id" {
  description = "The object ID of service principal"
  type        = string
  sensitive   = true
}

variable "key_vault_name" {
  description = "The name of the Azure Key Vault"
  type        = string
}

variable "workspace1_name" {
  description = "Name of the first Log Analytics workspace"
  type        = string
}

variable "workspace1_resource_group_name" {
  description = "Resource group name of the first Log Analytics workspace"
  type        = string
}

variable "workspace2_name" {
  description = "Name of the second Log Analytics workspace"
  type        = string
}

variable "workspace2_resource_group_name" {
  description = "Resource group name of the second Log Analytics workspace"
  type        = string
}

variable "security_center_contact_email" {
  description = "Contact email for Security Center alerts"
  type        = string
}

variable "security_center_contact_phone" {
  description = "Contact phone number for Security Center alerts"
  type        = string
}

variable "security_center_pricing_tier" {
  description = "Pricing tier for Security Center"
  type        = string
  default     = "Standard"
}

variable "security_center_alert_notifications" {
  description = "Enable alert notifications"
  type        = bool
  default     = true
}

variable "security_center_alerts_to_admins" {
  description = "Send alerts to admins"
  type        = bool
  default     = true
}
