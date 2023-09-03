locals {
  tags = {
    product     = var.prefix
    environment = var.environment
  }
}

resource "azurerm_resource_group" "xiao_rg" {
  name     = "rg-${var.prefix}-${var.environment}-${var.padding}"
  location = var.default_region

  tags = local.tags
}

resource "azurerm_resource_group" "xiao_example_rg" {
  name     = "rg-xiao-example"
  location = var.default_region

  tags = local.tags
}

module "vnet" {
  location = var.default_region
  # resource_group_name            = azurerm_resource_group.xiao_rg.name
  resource_group_name           = azurerm_resource_group.xiao_example_rg.name
  source                        = "./modules/vnet"
  tags                          = merge(local.tags, var.networking_settings.tags)
  address_space                 = var.networking_settings.vnet_address_space
  address_space_default_private = var.networking_settings.snet_private_address_space
  dns_server                    = var.networking_settings.dns_server
  nsg_default_private           = "nsg-${var.prefix}-default-private-${var.environment}-${var.padding}"
  snet_vm_name                  = "snet-${var.prefix}-vm-external-${var.environment}-${var.padding}"
  snet_default_private          = "snet-${var.prefix}-default-private-${var.environment}-${var.padding}"
  vnet_name                     = "vnet-${var.prefix}-${var.environment}-${var.padding}"
}

module "vm" {
  location = var.default_region
  # resource_group_name            = azurerm_resource_group.xiao_rg.name
  resource_group_name                 = azurerm_resource_group.xiao_example_rg.name
  source                              = "./modules/vm"
  tags                                = merge(local.tags, var.networking_settings.tags)
  public_ip_allocation_method         = "Static"
  nic_name                            = "nic-${var.prefix}-${var.environment}-${var.padding}"
  nic_configuration_name              = "nic-config-${var.prefix}-${var.environment}-${var.padding}"
  vm_name                             = "vm-${var.prefix}-${var.environment}-${var.padding}"
  vm_size                             = "Standard_B2s"
  ip_sku                              = "Basic"
  vm_storage_account_name             = "stvm${var.prefix}${var.environment}${var.padding}"
  vm_min_tls_version                  = "TLS1_2"
  vm_account_replication_type         = "LRS"
  vm_account_tier                     = "Standard"
  private_ip_address_allocation       = "Dynamic"
  os_disk_name                        = "osdisk-${var.prefix}-${var.environment}-${var.padding}"
  os_disk_caching                     = "ReadWrite"
  os_disk_storage_account_type        = "Standard_LRS"
  source_image_reference_publisher    = "Canonical"
  source_image_reference_offer        = "0001-com-ubuntu-server-focal"
  source_image_reference_sku          = "20_04-lts-gen2"
  source_image_reference_version      = "latest"
  vm_computer_name                    = "cpn-${var.prefix}-${var.environment}-${var.padding}"
  vm_admin_username                   = var.vm_admin_username
  vm_disable_password_authentication  = false
  vm_admin_password                   = var.vm_admin_password
  default_private_subnet_id           = module.vnet.snet_id_private
}