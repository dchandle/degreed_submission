module "aks" {
  source = "../../modules/AKS"
  name   = var.cluster_name
  location = var.location
}

module "service-deployment" {
  depends_on   = [module.aks]
  source       = "../services"

  cluster_name = module.aks.cluster_name
}
