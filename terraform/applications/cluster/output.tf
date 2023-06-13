output "kubernetes_cluster_name" {
  value = module.aks.cluster_name
}

output "kubernetes_resource_group" {
  value = module.aks.cluster_resource_group
}
