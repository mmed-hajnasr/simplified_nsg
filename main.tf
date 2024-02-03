resource "azurerm_network_security_group" "the_nsg" {
  name                = ""
  location            = var.location
  resource_group_name = azurerm_resource_group.the_group.name
}
