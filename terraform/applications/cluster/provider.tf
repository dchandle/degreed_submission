terraform {
  required_version = ">= 1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.3"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.1.0"
    }
  }
}

provider "azurerm" {
  features {}
}

// Use cluster data to instantiate connection for kubernetes provider
data "azurerm_kubernetes_cluster" "default" {
  depends_on          = [module.aks]
  name                = module.aks.cluster_name
  resource_group_name = module.aks.cluster_resource_group
}

provider "kubernetes" {
  host                   = data.azurerm_kubernetes_cluster.default.kube_config[0].host
  client_certificate     = base64decode(data.azurerm_kubernetes_cluster.default.kube_config[0].client_certificate)
  client_key             = base64decode(data.azurerm_kubernetes_cluster.default.kube_config[0].client_key)
  cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.default.kube_config[0].cluster_ca_certificate)
}
