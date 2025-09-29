resource "kubernetes_namespace" "argo_rollouts" {
  metadata { name = "argo-rollouts" }
}

resource "helm_release" "argo_rollouts" {
  name       = "argo-rollouts"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-rollouts"
  version    = "2.38.0"
  namespace  = kubernetes_namespace.argo_rollouts.metadata[0].name
  values = [<<EOF
installCRDs: true
dashboard:
  enabled: true
  service:
    type: NodePort
EOF
  ]
}
