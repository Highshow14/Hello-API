resource "kubernetes_namespace" "security" {
  metadata { name = "security" }
}

resource "helm_release" "vault" {
  name       = "vault"
  repository = "https://helm.releases.hashicorp.com"
  chart      = "vault"
  version    = "0.28.0"
  namespace  = kubernetes_namespace.security.metadata[0].name
  values = [<<EOF
server:
  dev:
    enabled: true
csi:
  enabled: true
EOF
  ]
}
