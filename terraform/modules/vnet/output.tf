
output "snet_default_private_subnet_address_prefix" {
  description = "The address prefixes of the default_private public subnet"
  value       = azurerm_subnet.default_private.address_prefixes
}

output "nsg_association_id_default_private" {
  description = "The ID of the private subnet to NSG association."
  value       = azurerm_network_security_group.nsg_default_private.id
}

output "snet_id_private" {
  description = "The ID of the Private Subnet."
  value       = azurerm_subnet.default_private.id
}

output "snet_id_bastion" {
  description = "The ID of the Bastion Subnet."
  value       = azurerm_subnet.bastion_subnet.id
}

output "snet_name_private" {
  description = "The name of the Private Subnet."
  value       = azurerm_subnet.default_private.name
}

output "vnet" {
  description = "The full virtual network object."
  value       = azurerm_virtual_network.vnet
}

output "vnet_id" {
  description = "The ID of the virtual network."
  value       = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  description = "The name of the virtual network."
  value       = azurerm_virtual_network.vnet.name
}
