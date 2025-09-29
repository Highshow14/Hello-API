resource "kubernetes_namespace" "argocd" {
  metadata { name = "argocd" }
}

resource "helm_release" "argocd" {
  name       = "argo-cd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "6.7.12"
  namespace  = kubernetes_namespace.argocd.metadata[0].name
  values = [<<EOF
server:
  service:
    type: NodePort
EOF
  ]
}
