provider "azurerm" {
  features {}
  subscription_id = "7b0a02df-610c-494c-9d32-e5883372662e"
}

resource "azurerm_resource_group" "aks_rg" {
  name     = "aks-lab"
  location = "Canada Central"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-lab-cluster"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "akslab"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2as_v4"  # or your actual VM size used yesterday
  }

  identity {
    type = "SystemAssigned"
  }
}
