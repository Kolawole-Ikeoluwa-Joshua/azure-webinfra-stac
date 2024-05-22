# --- vms/main.tf ---

resource "azurerm_availability_set" "web_av_set" {
  name                = "webAvailabilitySet"
  location            = var.location
  resource_group_name = var.resource_group_name
  managed             = true
}

resource "azurerm_windows_virtual_machine" "web_tier" {
  count               = 2
  name                = "webTierVM${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_group_name
  availability_set_id = azurerm_availability_set.web_av_set.id
  size                = "Standard_D2s_v3"
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  network_interface_ids = [azurerm_network_interface.web_tier[count.index].id]

  os_disk {
    name                 = "web_os_disk${count.index + 1}"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb         = 128
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}

resource "azurerm_windows_virtual_machine" "db_tier" {
  name                = "dbTierVM"
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = "Standard_D4s_v3"
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  network_interface_ids = [azurerm_network_interface.db_tier.id]

  os_disk {
    name                 = "db_os_disk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb         = 256
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}
