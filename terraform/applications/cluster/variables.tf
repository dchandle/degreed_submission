variable "location" {
    description = "(Optional) Azure Location for deployment"
    type = string
    default = "Australia Central"
}

variable "cluster_name" {
    description = "Name for aks cluster"
    type = string
    default = "aks-cluster"
}
