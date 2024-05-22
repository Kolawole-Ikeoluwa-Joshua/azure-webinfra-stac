# --- load_balancer/main.tf ---

resource "azurerm_public_ip" "lb_public_ip" {
  name                = "lbPublicIp"
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
  resource_group_name = var.resource_group_name
}

resource "azurerm_lb" "main" {
  name                = "mainLoadBalancer"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "frontendIpConfig"
    public_ip_address_id = azurerm_public_ip.lb_public_ip.id
  }
}

resource "azurerm_lb_backend_address_pool" "web_tier_pool" {
  name            = "webTierBackendPool"
  loadbalancer_id = azurerm_lb.main.id
}

resource "azurerm_lb_probe" "http_probe" {
  name                = "httpProbe"
  loadbalancer_id     = azurerm_lb.main.id
  protocol            = "Http"
  port                = 80
  request_path        = "/"
  interval_in_seconds = 5
  number_of_probes    = 2
}

resource "azurerm_lb_rule" "http_lb_rule" {
  name                           = "httpLbRule"
  loadbalancer_id                = azurerm_lb.main.id
  frontend_ip_configuration_name = "frontendIpConfig"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.web_tier_pool.id]
  probe_id                       = azurerm_lb_probe.http_probe.id
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  idle_timeout_in_minutes        = 4
  enable_floating_ip             = false
}
