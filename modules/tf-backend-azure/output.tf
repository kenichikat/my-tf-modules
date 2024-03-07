output "resource_group_name" {
    value = azurerm_resource_group.this.name
}

output "storage_account_name" {
    value = azurerm_storage_account.this.name
}

output "storage_container_name" {
    value = azurerm_storage_container.this.name
}
