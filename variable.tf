variable "resource_group_name" {
  description = "Resource group containing the storage account"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the Azure Storage Account"
  type        = string
}

variable "container_name" {
  description = "Name of the blob container"
  type        = string
}

variable "key" {
  description = "Name of the state file in the container"
    type        = string
}