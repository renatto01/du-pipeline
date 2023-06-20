# helm repo add argo https://argoproj.github.io/argo-helm
# helm repo update
# helm repo list
# helm search repo argo
# helm show values argo/argo-cd --version 5.34.6 > defaults/01-argocd-defaults.yaml
# helm install argocd -n argocd --create-namespace argo/argo-cd --version 5.34.6 -f terraform/values/01-argocd.yaml

resource "helm_release" "argocd" {
  name = "argocd"

  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true
  version          = "5.34.6"

  values = [file("values/01-argocd.yaml")]
}
