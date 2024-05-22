# --- backup/variables.tf ---
variable "location" {
  description = "The Azure region where the resources will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "web_tier_vm_ids" {
  description = "IDs of the web tier VMs"
  type        = list(string)
}

variable "db_tier_vm_id" {
  description = "ID of the database tier VM"
  type        = string
}
