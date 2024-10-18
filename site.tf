terraform {
    backend "azurerm" {
        
    }
}

provider "azurerm" {
    features{}
}

resource "azurerm_resource_group" "rg" {
    name = "rg-auladevops-001"
    location = "brazilsouth"
    tags = merge(var.tags, {
        "workspace" = "${terraform.workspace}"
        }
    )
}

resource "azurerm_storage_account" "site" {
    name = "stauladevopsguil001"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    account_kind = "StorageV2"
    account_tier = "Standard"
    account_replication_type = "LRS"

    static_website {
        index_document = "index.html"
    }

    tags = merge(var.tags, {
        "workspace" = "${terraform.workspace}"
        }
    )
}

