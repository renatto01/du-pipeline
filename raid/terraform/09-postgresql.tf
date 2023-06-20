# helm repo add bitnami https://charts.bitnami.com/bitnami
# helm repo update
# helm repo list
# helm search repo bitnami
# helm show values bitnami/postgresql --version 12.5.6 > defaults/09-postgresql-defaults.yaml
# helm install postgresql -n postgresql --create-namespace https://charts.bitnami.com/bitnami --create-namespace postgres ?????

resource "helm_release" "postgresql" {
  name = "postgresql"

  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "postgresql"
  namespace        = "bitnami"
  create_namespace = true
  version          = "12.5.6"

  values = [file("values/09-postgresql.yaml")]
}
