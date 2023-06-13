resource "kubernetes_deployment" "service" {
  metadata {
    name      = var.tier_name_gobuffapp
    namespace = kubernetes_namespace.cluster.metadata[0].name
  }

  spec {
    selector {
      match_labels = {
        app   = var.app_name
        tier  = var.tier_name_gobuffapp
        track = "stable"
      }
    }
    template {
      metadata {
        labels = {
          app   = var.app_name
          tier  = var.tier_name_gobuffapp
          track = "stable"
        }
      }
      spec {

        container {
          image = var.gobuffapp_image
          name  = var.tier_name_gobuffapp

          env {
            name  = "WAIT_HOSTS"
            value = "${var.app_name}:${var.database_port}"
          }

          env {
            name  = "DATABASE_HOST"
            value = var.app_name
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

resource "kubernetes_service" "service" {

  metadata {
    name      = var.tier_name_gobuffapp
    namespace = kubernetes_namespace.cluster.metadata[0].name
  }

  spec {
    type = "LoadBalancer"

    port {
      protocol    = "TCP"
      port        = var.gobuffapp_port
      target_port = var.gobuffapp_exposed_port
    }

    selector = {
      app  = var.tier_name_gobuffapp
    }
  }
}
