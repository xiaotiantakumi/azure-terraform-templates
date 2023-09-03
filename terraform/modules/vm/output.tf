output "vm_id" {
  description = "The ID of the Chunker VM."
  value       = azurerm_linux_virtual_machine.vm.id
}

output "vm_name" {
  description = "The name of the Chunker VM."
  value       = azurerm_linux_virtual_machine.vm.name
}

output "vm_storage_account_id" {
  description = "The ID of the VM Storage Account."
  value       = azurerm_storage_account.vm_storage_account.id
}

output "vm_storage_account_name" {
  description = "The name of the VM Storage Account."
  value       = azurerm_storage_account.vm_storage_account.name
}

output "azure_vm_nic_id" {
  description = "The ID of the Azure VM NIC."
  value       = azurerm_network_interface.azure_vm_nic.id
}

output "azure_vm_nic_name" {
  description = "The name of the Azure VM NIC."
  value       = azurerm_network_interface.azure_vm_nic.name
}