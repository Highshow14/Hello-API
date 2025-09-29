output "namespaces" {
  value = [
    kubernetes_namespace.argocd.metadata[0].name,
    kubernetes_namespace.monitoring.metadata[0].name,
    kubernetes_namespace.security.metadata[0].name,
    kubernetes_namespace.argo_rollouts.metadata[0].name
  ]
}
