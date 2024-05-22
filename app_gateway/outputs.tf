# --- app_gateway/outputs.tf ---

output "appgw_public_ip" {
  value = azurerm_public_ip.appgw_public_ip.ip_address
}

output "appgw_id" {
  value = azurerm_application_gateway.main.id
}
