# storage account
output "storage_account_id" {
  description = "The ID of the Storage Account."
  value       = module.functions.storage_account_id
}

output "storage_account_name" {
  description = "The name of the Storage Account."
  value       = module.functions.storage_account_name
}

output "storage_account_primary_access_key" {
  description = "The primary access key for the Storage Account."
  value       = module.functions.storage_account_primary_access_key
  sensitive = true
}

output "storage_account_primary_connection_string" {
  description = "The primary connection string for the Storage Account."
  value       = module.functions.storage_account_primary_connection_string
  sensitive = true
}

# azurerm service plan
output "service_plan_id" {
  description = "The ID of the App Service Plan."
  value       = module.functions.service_plan_id
}

output "service_plan_name" {
  description = "The name of the App Service Plan."
  value       = module.functions.service_plan_name
}

# azurerm function app
output "function_app_id" {
  description = "The ID of the Function App."
  value       = module.functions.function_app_id
}

output "function_app_name" {
  description = "The name of the Function App."
  value       = module.functions.function_app_name
}

output "function_app_default_hostname" {
  description = "The default hostname of the Function App."
  value       = module.functions.function_app_default_hostname
}