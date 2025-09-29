resource "kubernetes_namespace" "monitoring" {
  metadata { name = "monitoring" }
}

resource "helm_release" "kps" {
  name       = "kube-prometheus-stack"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  version    = "65.2.0"
  namespace  = kubernetes_namespace.monitoring.metadata[0].name
  values = [<<EOF
grafana:
  adminPassword: "admin"
  service:
    type: NodePort
prometheus:
  prometheusSpec:
    serviceMonitorSelectorNilUsesHelmValues: false
EOF
  ]
}
