provider "azurerm" {
  features {}
}

resource "azurerm_storage_account" "az_storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "az_service_plan" {
  name                = "app-service-plan"
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "Y1"
}

resource "azurerm_linux_function_app" "az_func" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
  location            = var.location

  storage_account_name       = azurerm_storage_account.az_storage.name
  storage_account_access_key = azurerm_storage_account.az_storage.primary_access_key
  service_plan_id            = azurerm_service_plan.az_service_plan.id
  # insight
  # application_insights_connection_string = var.application_insights_connection_string
  # application_insights_key               = var.application_insights_key
  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = var.application_insights_key
    "APPINSIGHTS_CONNECTION_STRING" = var.application_insights_connection_string
  }
  site_config {}
}