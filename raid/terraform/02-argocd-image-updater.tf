# helm repo add argo https://argoproj.github.io/argo-helm
# helm repo update
# helm repo list
# helm search repo argo
# helm show values argo/argocd-image-updater --version 0.9.1 > defaults/02-argocd-image-updater-defaults.yaml
# helm install updater -n argocd argo/argocd-image-updater --version 0.9.1 -f terraform/values/02-argocd-image-updater.yaml

resource "helm_release" "updater" {
  name = "updater"

  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argocd-image-updater"
  namespace        = "argocd"
  create_namespace = true
  version          = "0.9.1"

  values = [file("values/02-argocd-image-updater.yaml")]
}
