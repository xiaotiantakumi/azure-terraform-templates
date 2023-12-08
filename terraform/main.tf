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
