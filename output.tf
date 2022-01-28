# cosmos db table 

output "table_id" {
  value = azurerm_cosmosdb_sql_database.database_id.id
}

output "table_name" {
  value = azurerm_cosmosdb_sql_database.database_id.name
}

# cosmos db account

output "cosmosdb_account_id" {
  value = azurerm_cosmosdb_account.db.id
}

output "cosmosdb_account_name" {
  value = azurerm_cosmosdb_account.db.name
}

output "cosmosdb_account_primary_key" {
  value = azurerm_cosmosdb_account.db.primary_key
  sensitive = true
}

output "cosmosdb_account_secondary_key" {
  value = azurerm_cosmosdb_account.db.secondary_key
  sensitive = true
}

output "cosmosdb_account_endpoint" {
  value = azurerm_cosmosdb_account.db.endpoint
}


