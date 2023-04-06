resource "kubernetes_ingress_v1" "ops_360__swagger_services" {
  metadata {
    name      = "ops360-swagger-services"
    namespace = "uat01"

    annotations = {
      "kubernetes.io/ingress.class" = "nginx"

      "nginx.ingress.kubernetes.io/backend-protocol" = "HTTP"

      "nginx.ingress.kubernetes.io/ssl-passthrough" = "true"
    }
  }

  spec {
    tls {
      hosts       = ["bdms-service.ops360uat01.acx-sandbox.net", "process-tracking.ops360uat01.acx-sandbox.net", "ac-dl-ingest.ops360uat01.acx-sandbox.net"]
      secret_name = "ops360uat01-cert"
    }

    rule {
      host = "bdms-service.ops360uat01.acx-sandbox.net"

      http {
        path {
          path      = "/"
          path_type = "Prefix"

          backend {
            service {
              name = "bdms-service"

              port {
                number = 6969
              }
            }
          }
        }
      }
    }

    rule {
      host = "process-tracking.ops360uat01.acx-sandbox.net"

      http {
        path {
          path      = "/"
          path_type = "Prefix"

          backend {
            service {
              name = "process-tracking"

              port {
                number = 8090
              }
            }
          }
        }
      }
    }

    rule {
      host = "ac-dl-ingest.ops360uat01.acx-sandbox.net"

      http {
        path {
          path      = "/"
          path_type = "Prefix"

          backend {
            service {
              name = "ac-dl-ingest"

              port {
                number = 9010
              }
            }
          }
        }
      }
    }
  }
}

