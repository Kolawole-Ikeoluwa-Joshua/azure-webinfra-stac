# --- vms/outputs.tf ---
output "web_tier_vm_ids" {
  value = azurerm_windows_virtual_machine.web_tier.*.id
}

output "db_tier_vm_id" {
  value = azurerm_windows_virtual_machine.db_tier.id
}
