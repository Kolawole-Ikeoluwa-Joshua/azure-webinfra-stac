# --- nsg/outputs.tf ---
output "web_tier_nsg_id" {
  value = azurerm_network_security_group.web_tier_nsg.id
}

output "db_tier_nsg_id" {
  value = azurerm_network_security_group.db_tier_nsg.id
}
