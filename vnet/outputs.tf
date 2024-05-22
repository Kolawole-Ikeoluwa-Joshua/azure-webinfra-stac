# --- vnet/outputs.tf ---
output "vnet_id" {
  value = azurerm_virtual_network.main.id
}

output "web_tier_subnet_id" {
  value = azurerm_subnet.web_tier.id
}

output "web_tier_subnet_prefix" {
  value = azurerm_subnet.web_tier.address_prefixes
}

output "db_tier_subnet_id" {
  value = azurerm_subnet.db_tier.id
}

output "db_tier_subnet_prefix" {
  value = azurerm_subnet.db_tier.address_prefixes
}
