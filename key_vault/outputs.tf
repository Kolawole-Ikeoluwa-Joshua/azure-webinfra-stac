# --- key_vault/outputs.tf ---

output "key_vault_id" {
  value = azurerm_key_vault.main.id
}
