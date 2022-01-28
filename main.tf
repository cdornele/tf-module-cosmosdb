resource "random_integer" "ri" {
    min=10000
    max=99999
}

resource "azurerm_cosmosdb_account" "db" {
    name                        = "${var.prefix}-${var.service}-db-${random_integer.ri.result}"
    location                    = var.build_location
    resource_group_name         = var.resource_group
    offer_type                  = "Standard"
    kind                        = var.cosmosdb_kind
    enable_automatic_failover   = false
    enable_free_tier            = true
    tags                        = var.tags
    dynamic "capabilities" {
           for_each = var.capabilities
           content{
               name = capabilities.value.name
           }
    } 
    consistency_policy {
        consistency_level = var.consistency_level
        max_interval_in_seconds = var.max_interval_in_seconds
        max_staleness_prefix = var.max_staleness_prefix
    }
    backup {
        type = "Periodic"
        interval_in_minutes = "240"
        retention_in_hours = "8"
        storage_redundancy = "Local"
    }
    geo_location {
        location          = var.build_location
        failover_priority = 0
    }
}


resource "azurerm_cosmosdb_sql_database" "database_id" {
  name                = var.database_ID
  resource_group_name = azurerm_cosmosdb_account.db.resource_group_name
  account_name        = azurerm_cosmosdb_account.db.name
  throughput          = 400
}

resource "azurerm_cosmosdb_sql_container" "collection_id" {
  name                  = var.collection_id
  resource_group_name   = azurerm_cosmosdb_account.db.resource_group_name
  account_name          = azurerm_cosmosdb_account.db.name
  database_name         = azurerm_cosmosdb_sql_database.database_id.name
  partition_key_path    = "/title"
  partition_key_version = 1
  throughput            = 400
}