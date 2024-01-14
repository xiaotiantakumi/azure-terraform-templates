locals {
  tags = {
    product     = var.prefix
    environment = var.environment
  }
}


data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

data "azurerm_application_insights" "app_insights" {
  name                = var.app_insights_name
  resource_group_name = var.resource_group_name
}

module "functions" {
  source              = "./modules/functions"
  location            = var.default_region
  resource_group_name = var.resource_group_name
  tags                = local.tags
  application_insights_connection_string = data.azurerm_application_insights.app_insights.connection_string
  application_insights_key               = data.azurerm_application_insights.app_insights.instrumentation_key
}