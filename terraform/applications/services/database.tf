resource "kubernetes_deployment" "database" {
  metadata {
    name      = var.app_name
    namespace = kubernetes_namespace.cluster.metadata[0].name
  }
  
  spec {
    selector {
      match_labels = {
        app   = var.app_name
        tier  = var.tier_name_database
        track = "stable"
      }
    }
    template {
      metadata {
        labels = {
          app   = var.app_name
          tier  = var.tier_name_database
          track = "stable"
        }
      }
      spec {

        container {
          name  = var.tier_name_database
          image = var.database_image

          env {
            name  = "POSTGRES_DB"
            value = var.postgres_db
          }

          env {
            name  = "POSTGRES_PASSWORD"
            value = var.postgres_password
          }

          env {
            name  = "POSTGRES_USER"
            value = var.postgres_user
          }

          port {
            container_port = var.database_port
          }

          resources {
            limits = {
              memory = "512M"
              cpu    = "1"
            }
            requests = {
              memory = "256M"
              cpu    = "50m"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "database" {

  metadata {
    name      = var.app_name
    namespace = kubernetes_namespace.cluster.metadata[0].name
  }
  
  spec {
    port {
      protocol    = "TCP"
      port        = var.database_port
      target_port = var.database_port
    }

    selector = {
      app  = var.app_name
      tier = var.tier_name_database
    }
  }
}
