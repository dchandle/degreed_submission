resource "kubernetes_namespace" "cluster" {
  metadata {
    name = var.app_name
  }
}
