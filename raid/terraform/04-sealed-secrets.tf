# helm repo add sealed-secrets https://bitnami-labs.github.io/sealed-secrets
# helm repo update
# helm repo list
# helm search repo sealed-secrets
# helm show values sealed-secrets/sealed-secrets --version 2.9.0 > defaults/04-sealed-secrets-defaults.yaml
# helm install sealed-secrets -n kube-system --create-namespace sealed-secrets/sealed-secrets --version 2.9.0 -f terraform/values/04-sealed-secrets.yaml

resource "helm_release" "sealed_secrets" {
  name = "sealed-secrets"

  repository       = "https://bitnami-labs.github.io/sealed-secrets"
  chart            = "sealed-secrets"
  namespace        = "sealed-secrets"
  create_namespace = true
  version          = "2.9.0"

  values = [file("values/04-sealed-secrets.yaml")]
}
