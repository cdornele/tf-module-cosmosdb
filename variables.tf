# default

variable "build_location" {
  type = string
  description = "Location where the resource will be stored"
}

variable "service" {
  type = string
  description = "A service name to assign the resource"
}

variable "resource_group" {
  type = string
  description = "Resource group where the resource will be stored"
}

variable "prefix" {
  type = string
  description = "Prefix name that will be used to named the resource"
}

# cosmos db

variable "cosmosdb_kind" {
  type = string
  description = "Cosmos DB Account Kind"
  default = "GlobalDocumentDB"
}

variable "capabilities" {
  description = "The capabilities which should be enabled for this Cosmos DB account."  
}

variable "consistency_level" {
  type = string
  description = "The consistency level to use for Cosmos DB Account"
  default = "BoundedStaleness"
}

variable "max_interval_in_seconds" {
  type = number
  description = "This value represents the time amount of staleness (in seconds) tolerated."
  default = 5
}

variable "max_staleness_prefix" {
  type = number
  description = "This value represents the number of stale requests tolerated"
  default = 100
}

variable "tags" {
  type = map(string)
  description = "A mapping of tags to assign to the resource."
}
# cosmos db database id

variable "database_ID" {
  type = string
  description = "Specifies the name of the Cosmos DB Container"
}

# cosmos db collections 

variable "collection_ID" {
  type = string
  description = "Specifies the name of the Cosmos DB Collection"
}