provider "azurerm" {
  features {}
}

resource "azurerm_network_security_group" "nsg_default_private" {
  location            = var.location
  name                = var.nsg_default_private
  resource_group_name = var.resource_group_name

  ## Allow all　Inbound traffic from vnet
  security_rule {
    access                     = "Allow"
    destination_address_prefix = "*"
    destination_port_range     = "*"
    direction                  = "Inbound"
    name                       = "allow_vnet_inbound"
    priority                   = 100
    protocol                   = "*"
    source_address_prefix      = var.address_space
    source_port_range          = "*"
  }

  ## Allow all　Outbound traffic from vnet
  security_rule {
    access                     = "Allow"
    destination_address_prefix = var.address_space
    destination_port_range     = "*"
    direction                  = "Outbound"
    name                       = "allow_vnet_outbound"
    priority                   = 100
    protocol                   = "*"
    source_address_prefix      = "*"
    source_port_range          = "*"
  }

  ## Deny all outbound to vnet
  security_rule {
    access                     = "Deny"
    destination_address_prefix = "*"
    destination_port_range     = "*"
    direction                  = "Inbound"
    name                       = "deny_all_inbound"
    priority                   = 200
    protocol                   = "*"
    source_address_prefix      = "*"
    source_port_range          = "*"
  }

  ## Deny all else outbound
  security_rule {
    access                     = "Deny"
    destination_address_prefix = "*"
    destination_port_range     = "*"
    direction                  = "Outbound"
    name                       = "deny_all_outbound"
    priority                   = 200
    protocol                   = "*"
    source_address_prefix      = "*"
    source_port_range          = "*"
  }
}

resource "azurerm_subnet" "default_private" {
  address_prefixes     = [var.address_space_default_private]
  name                 = var.snet_default_private
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
}

resource "azurerm_virtual_network" "vnet" {
  address_space       = [var.address_space]
  dns_servers         = [var.dns_server]
  location            = var.location
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  tags                = var.tags
}
