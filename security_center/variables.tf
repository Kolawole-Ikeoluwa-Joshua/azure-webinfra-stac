# --- security_center/variables.tf ---

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

variable "workspace1_id" {
  description = "ID of the first Log Analytics workspace"
  type        = string
}

variable "workspace1_scope" {
  description = "Scope of the first Log Analytics workspace"
  type        = string
}

variable "workspace2_id" {
  description = "ID of the second Log Analytics workspace"
  type        = string
}

variable "workspace2_scope" {
  description = "Scope of the second Log Analytics workspace"
  type        = string
}