# --- security_center/outputs.tf ---

output "security_center_pricing" {
  value = azurerm_security_center_subscription_pricing.standard.tier
}
