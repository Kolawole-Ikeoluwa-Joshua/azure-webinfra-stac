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

module "security_center" {
  source = "./security_center"
}