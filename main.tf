# --- root/main.tf ---

module "vnet" {
  source              = "./vnet"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "nsg" {
  source                 = "./nsg"
  location               = var.location
  resource_group_name    = var.resource_group_name
  web_tier_subnet_prefix = module.vnet.web_tier_subnet_prefix[0]
  db_tier_subnet_prefix  = module.vnet.db_tier_subnet_prefix[0]
}

module "vms" {
  source              = "./vms"
  location            = var.location
  resource_group_name = var.resource_group_name
  web_tier_subnet_id  = module.vnet.web_tier_subnet_id
  db_tier_subnet_id   = module.vnet.db_tier_subnet_id
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}

module "load_balancer" {
  source              = "./load_balancer"
  location            = var.location
  resource_group_name = var.resource_group_name
}

module "app_gateway" {
  source              = "./app_gateway"
  location            = var.location
  resource_group_name = var.resource_group_name
  web_tier_subnet_id  = module.vnet.web_tier_subnet_id
}

module "sql_database" {
  source              = "./sql_database"
  location            = var.location
  resource_group_name = var.resource_group_name
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}

module "key_vault" {
  source              = "./key_vault"
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = var.tenant_id
  admin_object_id     = var.admin_object_id
  key_vault_name      = var.key_vault_name
}

module "backup" {
  source              = "./backup"
  location            = var.location
  resource_group_name = var.resource_group_name
  web_tier_vm_ids     = module.vms.web_tier_vm_ids
  db_tier_vm_id       = module.vms.db_tier_vm_id
}

###################
# security center #
###################

resource "azurerm_log_analytics_workspace" "workspace1" {
  name                = var.workspace1_name
  location            = var.location
  resource_group_name = var.workspace1_resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_log_analytics_workspace" "workspace2" {
  name                = var.workspace2_name
  location            = var.location
  resource_group_name = var.workspace2_resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

module "security_center" {
  source = "./security_center"

  workspace1_id    = azurerm_log_analytics_workspace.workspace1.id
  workspace1_scope = "/subscriptions/${var.subscription_id}"

  workspace2_id    = azurerm_log_analytics_workspace.workspace2.id
  workspace2_scope = "/subscriptions/${var.subscription_id}/resourceGroups/${var.workspace2_resource_group_name}"

  security_center_contact_email       = var.security_center_contact_email
  security_center_contact_phone       = var.security_center_contact_phone
  security_center_pricing_tier        = var.security_center_pricing_tier
  security_center_alert_notifications = var.security_center_alert_notifications
  security_center_alerts_to_admins    = var.security_center_alerts_to_admins
}