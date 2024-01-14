variable "location" {
  default     = "japaneast"
  description = "The Azure location to provision the resource in"
  type        = string
}

variable "resource_group_name" {
  description = "The name for the resource group"
  type        = string
}

variable "tags" {
  default     = {}
  description = "The tags to include for each of the provisioned resources"
  type        = map(string)
}

variable "function_name" {
  description = "The name for the function app"
  type        = string
  default     = "func-xiaotian-dev-001"
}

variable "storage_account_name" {
  description = "The name for the storage account"
  type        = string
  default     = "staxiaotiandev001"
}

variable "application_insights_connection_string" {
  description = "The connection string for the application insights instance"
  type        = string
}

variable "application_insights_key" {
  description = "The key for the application insights instance"
  type        = string
}