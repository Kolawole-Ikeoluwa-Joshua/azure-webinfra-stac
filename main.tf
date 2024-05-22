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