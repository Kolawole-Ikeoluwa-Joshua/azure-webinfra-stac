# --- security_center/main.tf ---

resource "azurerm_security_center_contact" "contact" {
  email               = var.security_center_contact_email
  phone               = var.security_center_contact_phone
  alert_notifications = var.security_center_alert_notifications
  alerts_to_admins    = var.security_center_alerts_to_admins
}

resource "azurerm_security_center_subscription_pricing" "example" {
  tier = var.security_center_pricing_tier

}

resource "azurerm_security_center_workspace" "workspace1" {
  scope        = var.workspace1_scope
  workspace_id = var.workspace1_id
}

resource "azurerm_security_center_workspace" "workspace2" {
  scope        = var.workspace2_scope
  workspace_id = var.workspace2_id
}
