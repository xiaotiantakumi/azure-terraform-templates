
# storage account
output "storage_account_id" {
  description = "The ID of the Storage Account."
  value       = azurerm_storage_account.az_storage.id
}

output "storage_account_name" {
  description = "The name of the Storage Account."
  value       = azurerm_storage_account.az_storage.name
}

output "storage_account_primary_access_key" {
  description = "The primary access key for the Storage Account."
  value       = azurerm_storage_account.az_storage.primary_access_key
}

output "storage_account_primary_connection_string" {
  description = "The primary connection string for the Storage Account."
  value       = azurerm_storage_account.az_storage.primary_connection_string
}

# azurerm service plan
output "service_plan_id" {
  description = "The ID of the App Service Plan."
  value       = azurerm_service_plan.az_service_plan.id
}

output "service_plan_name" {
  description = "The name of the App Service Plan."
  value       = azurerm_service_plan.az_service_plan.name
}

# azurerm function app
output "function_app_id" {
  description = "The ID of the Function App."
  value       = azurerm_linux_function_app.az_func.id
}

output "function_app_name" {
  description = "The name of the Function App."
  value       = azurerm_linux_function_app.az_func.name
}

output "function_app_default_hostname" {
  description = "The default hostname of the Function App."
  value       = azurerm_linux_function_app.az_func.default_hostname
}