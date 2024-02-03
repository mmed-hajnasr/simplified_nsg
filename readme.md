# Simplified_nsg

## Description

a terraform module that simplifies the creation of an azurerm_network_security_group using predefined rules.

## Requirements

- hashicorp/azurerm

## Usage

```hcl
module "example_nsg"{
    source = "github.com/mmed-hadjnasr/simplified_nsg"
    name="example_nsg"
    location            = "francecentral"
    resource_group_name = "test"
    rules               = ["Allow-SSH-IN","Allow-HTTP-IN"]
}
```
