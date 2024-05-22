# --- backup/main.tf ---

resource "azurerm_backup_policy_vm" "daily_backup_policy" {
  name                = "dailyBackupPolicy"
  resource_group_name = var.resource_group_name
  recovery_vault_name = azurerm_recovery_services_vault.main.name

  backup {
    frequency = "Daily"
    time      = "23:00"
  }

  retention_daily {
    count = 7
  }
}

resource "azurerm_backup_protected_vm" "web_tier_backup" {
  count               = 2
  resource_group_name = var.resource_group_name
  recovery_vault_name = azurerm_recovery_services_vault.main.name
  source_vm_id        = var.web_tier_vm_ids[count.index]
  backup_policy_id    = azurerm_backup_policy_vm.daily_backup_policy.id
}

resource "azurerm_backup_protected_vm" "db_tier_backup" {
  resource_group_name = var.resource_group_name
  recovery_vault_name = azurerm_recovery_services_vault.main.name
  source_vm_id        = var.db_tier_vm_id
  backup_policy_id    = azurerm_backup_policy_vm.daily_backup_policy.id
}

resource "azurerm_recovery_services_vault" "main" {
  name                = "mainRecoveryVault"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
}
