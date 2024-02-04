resource "azurerm_network_security_group" "the_nsg" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  
  dynamic "security_rule" {
    for_each = var.custom_rules
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }

  dynamic "security_rule" {
    for_each = var.rules
    content {
      name                       = security_rule.value
      priority                   = local.predefined_rules[security_rule.value].priority
      direction                  = local.predefined_rules[security_rule.value].direction
      access                     = local.predefined_rules[security_rule.value].access
      protocol                   = local.predefined_rules[security_rule.value].protocol
      source_port_range          = local.predefined_rules[security_rule.value].source_port_range
      destination_port_range = local.predefined_rules[security_rule.value].destination_port_range
      source_address_prefix      = var.local_ip
      destination_address_prefix = local.predefined_rules[security_rule.value].destination_address_prefix
    }
  }
}