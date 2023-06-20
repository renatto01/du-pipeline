# helm repo add bakito https://charts.bakito.net
# helm repo update
# helm repo list
# helm search repo bakito
# helm show values bakito/sealed-secrets-web --version 3.1.1 > defaults/08-sealed-secrets-web-defaults.yaml
# helm install sealed-secrets-web -n kube-system --create-namespace bakito/sealed-secrets-web --version 3.1.1 -f terraform/values/08-sealed-secrets-web.yaml

resource "helm_release" "sealed_secrets_ui" {
  name = "sealed-secrets-ui"

  repository       = "https://charts.bakito.net/"
  chart            = "sealed-secrets-web"
  namespace        = "bakito"
  create_namespace = true
  version          = "3.1.1"

  values = [file("values/08-sealed-secrets-web.yaml")]
}
