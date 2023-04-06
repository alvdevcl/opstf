resource "kubernetes_ingress_v1" "ops_360__core_ui" {
  metadata {
    name      = "ops360-core-ui"
    namespace = "uat01"

    annotations = {
      "ingress.kubernetes.io/ssl-redirect" = "false"

      "kubernetes.io/ingress.class" = "nginx"

      "nginx.ingress.kubernetes.io/client-body-buffer-size" = "200M"

      "nginx.ingress.kubernetes.io/configuration-snippet" = "more_set_headers \"Cache-Control: no-cache\";"

      "nginx.ingress.kubernetes.io/force-ssl-redirect" = "false"

      "nginx.ingress.kubernetes.io/proxy-body-size" = "200m"

      "nginx.ingress.kubernetes.io/proxy-buffer-size" = "24576k"

      "nginx.ingress.kubernetes.io/server-snippet" = "add_header X-Request-ID $request_id;\nkeepalive_timeout 70;\nunderscores_in_headers on;\nproxy_http_version 1.1;\nclient_max_body_size 0;\ngzip  on;\ngzip_types\n  text/css\n  text/javascript\n  text/xml\n  text/plain\n  application/javascript\n  application/x-javascript\n  application/json;\nproxy_set_header Upgrade $http_upgrade;\nproxy_set_header Connection \"Upgrade\";"

      "nginx.ingress.kubernetes.io/ssl-redirect" = "false"

      "nginx.ingress.kubernetes.io/use-regex" = "true"
    }
  }

  spec {
    tls {
      hosts       = ["ops360uat01.acx-sandbox.net"]
      secret_name = "ops360uat01-cert"
    }

    rule {
      host = "ops360uat01.acx-sandbox.net"

      http {
        path {
          path      = "/"
          path_type = "Prefix"

          backend {
            service {
              name = "core-ui"

              port {
                number = 80
              }
            }
          }
        }

        path {
          path      = "/*/config.json"
          path_type = "Prefix"

          backend {
            service {
              name = "core-ui"

              port {
                number = 80
              }
            }
          }
        }

        path {
          path      = "/*/navigation.json"
          path_type = "Prefix"

          backend {
            service {
              name = "core-ui"

              port {
                number = 80
              }
            }
          }
        }

        path {
          path      = "/issue-service"
          path_type = "Prefix"

          backend {
            service {
              name = "issue-service"

              port {
                number = 9021
              }
            }
          }
        }

        path {
          path      = "/select"
          path_type = "Prefix"

          backend {
            service {
              name = "ac-select"

              port {
                number = 9000
              }
            }
          }
        }

        path {
          path      = "/ac"
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
  }
}

