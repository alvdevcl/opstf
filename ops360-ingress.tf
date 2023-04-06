resource "kubernetes_ingress_v1" "ops_360__core_ui_services" {
  metadata {
    name      = "ops360-core-ui-services"
    namespace = "uat01"

    annotations = {
      "ingress.kubernetes.io/ssl-redirect" = "false"

      "kubernetes.io/ingress.class" = "nginx"

      "nginx.ingress.kubernetes.io/client-body-buffer-size" = "200M"

      "nginx.ingress.kubernetes.io/configuration-snippet" = "more_set_headers \"Cache-Control: no-cache\";"

      "nginx.ingress.kubernetes.io/force-ssl-redirect" = "false"

      "nginx.ingress.kubernetes.io/proxy-body-size" = "200m"

      "nginx.ingress.kubernetes.io/proxy-buffer-size" = "24576k"

      "nginx.ingress.kubernetes.io/rewrite-target" = "/$2"

      "nginx.ingress.kubernetes.io/server-snippet" = "add_header X-Request-ID $request_id;\nkeepalive_timeout 70;\nunderscores_in_headers on;\nproxy_http_version 1.1;\nclient_max_body_size 0;\nclient_header_buffer_size 4096k;\nlarge_client_header_buffers 4 8096k;\ngzip  on;\ngzip_types\n  text/css\n  text/javascript\n  text/xml\n  text/plain\n  application/javascript\n  application/x-javascript\n  application/json;\nproxy_set_header Upgrade $http_upgrade;\nproxy_set_header Connection \"Upgrade\";"

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
          path      = "/ops360(/|$)(.*)"
          path_type = "Prefix"

          backend {
            service {
              name = "operations-board-ui"

              port {
                number = 8080
              }
            }
          }
        }

        path {
          path      = "/auth(/|$)(.*)"
          path_type = "Prefix"

          backend {
            service {
              name = "auth-service"

              port {
                number = 9005
              }
            }
          }
        }

        path {
          path      = "/browse(/|$)(.*)"
          path_type = "Prefix"

          backend {
            service {
              name = "browsing-ui"

              port {
                number = 4000
              }
            }
          }
        }

        path {
          path      = "/acx(/|$)(.*)"
          path_type = "Prefix"

          backend {
            service {
              name = "bdms-service-acx"

              port {
                number = 6970
              }
            }
          }
        }

        path {
          path      = "/data-model-admin(/|$)(.*)"
          path_type = "Prefix"

          backend {
            service {
              name = "data-model-admin-ui"

              port {
                number = 8094
              }
            }
          }
        }

        path {
          path      = "/data-view-admin(/|$)(.*)"
          path_type = "Prefix"

          backend {
            service {
              name = "data-view-admin-ui"

              port {
                number = 8095
              }
            }
          }
        }

        path {
          path      = "/bpm-admin(/|$)(.*)"
          path_type = "Prefix"

          backend {
            service {
              name = "bpm-admin-ui"

              port {
                number = 8096
              }
            }
          }
        }

        path {
          path      = "/task-service(/|$)(.*)"
          path_type = "Prefix"

          backend {
            service {
              name = "task-service-ui"

              port {
                number = 8097
              }
            }
          }
        }

        path {
          path      = "/tasks(/|$)(.*)"
          path_type = "Prefix"

          backend {
            service {
              name = "task-service"

              port {
                number = 9012
              }
            }
          }
        }

        path {
          path      = "/lineage(/|$)(.*)"
          path_type = "Prefix"

          backend {
            service {
              name = "ac-dl-read"

              port {
                number = 9009
              }
            }
          }
        }

        path {
          path      = "/datasets(/|$)(.*)"
          path_type = "Prefix"

          backend {
            service {
              name = "data-sets-service"

              port {
                number = 9011
              }
            }
          }
        }

        path {
          path      = "/lineage-stats(/|$)(.*)"
          path_type = "Prefix"

          backend {
            service {
              name = "lineage-stats"

              port {
                number = 9014
              }
            }
          }
        }

        path {
          path      = "/lineage-statistics(/|$)(.*)"
          path_type = "Prefix"

          backend {
            service {
              name = "lineage-stats-ui"

              port {
                number = 8098
              }
            }
          }
        }

        path {
          path      = "/cleansing(/|$)(.*)"
          path_type = "Prefix"

          backend {
            service {
              name = "data-cleansing-ui"

              port {
                number = 8083
              }
            }
          }
        }

        path {
          path      = "/ac-dl-ingest(/|$)(.*)"
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

        path {
          path      = "/data-model-admin(/|$)(.*)"
          path_type = "Prefix"

          backend {
            service {
              name = "data-model-admin-ui"

              port {
                number = 8094
              }
            }
          }
        }

        path {
          path      = "/process-tracking(/|$)(.*)"
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

        path {
          path      = "/spreadsheets(/|$)(.*)"
          path_type = "Prefix"

          backend {
            service {
              name = "spreadsheet-service"

              port {
                number = 9000
              }
            }
          }
        }

        path {
          path      = "/batch-publishing(/|$)(.*)"
          path_type = "Prefix"

          backend {
            service {
              name = "batch-publisher-ui"

              port {
                number = 8080
              }
            }
          }
        }

        path {
          path      = "/batch-publisher(/|$)(.*)"
          path_type = "Prefix"

          backend {
            service {
              name = "batch-publisher"

              port {
                number = 9017
              }
            }
          }
        }

        path {
          path      = "/select-new(/|$)(.*)"
          path_type = "Prefix"

          backend {
            service {
              name = "ac-select-ui"

              port {
                number = 8080
              }
            }
          }
        }
      }
    }
  }
}

