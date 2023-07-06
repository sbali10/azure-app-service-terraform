provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "existing" {
  name = "orcla-dev3"
}

resource "azurerm_container_registry" "example" {
  name                     = var.container_registry_name
  resource_group_name      = data.azurerm_resource_group.existing.name
  location                 = data.azurerm_resource_group.existing.location
  sku                      = "Standard"
  admin_enabled            = true
}

output "app_service_url" {
  value = azurerm_app_service.orcla-terraform-app-service.default_site_hostname
}


output "app_service_url2" {
  value = azurerm_app_service.orcla-terraform-manuel.default_site_hostname
}
