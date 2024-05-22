# --- vms/network_interfaces.tf ---

resource "azurerm_network_interface" "web_tier" {
  count               = 2
  name                = "webTierNic${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "webIpConfig${count.index + 1}"
    subnet_id                     = var.web_tier_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "db_tier" {
  name                = "dbTierNic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "dbIpConfig"
    subnet_id                     = var.db_tier_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

