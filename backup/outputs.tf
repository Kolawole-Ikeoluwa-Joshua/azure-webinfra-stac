# --- backup/outputs.tf ---

output "recovery_vault_id" {
  value = azurerm_recovery_services_vault.main.id
}
