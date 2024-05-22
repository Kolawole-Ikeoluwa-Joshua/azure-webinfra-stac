# --- key_vault/main.tf ---

resource "azurerm_key_vault" "main" {
  name                            = var.key_vault_name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  tenant_id                       = var.tenant_id
  enabled_for_deployment          = true
  enabled_for_disk_encryption     = true
  enabled_for_template_deployment = true
  sku_name                        = "standard"

  access_policy {
    tenant_id = var.tenant_id
    object_id = var.admin_object_id

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Purge",
    ]
  }
}

# Use the database connection string in your resources
data "azurerm_key_vault_secret" "database_connection_string" {
  name         = "DatabaseConnectionString"
  key_vault_id = azurerm_key_vault.main.id
}