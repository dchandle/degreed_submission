resource "local_file" "kubeconfig" {
  depends_on   = [azurerm_kubernetes_cluster.cluster]
  filename     = "../../../kubeconfig"
  content      = azurerm_kubernetes_cluster.cluster.kube_config_raw
}

output "cluster_name" {
  value = azurerm_kubernetes_cluster.cluster.name
}

output "cluster_endpoint" {
  value = azurerm_kubernetes_cluster.cluster
}

output "cluster_resource_group" {
  value = azurerm_resource_group.resource_group.name
}
