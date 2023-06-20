# helm repo add bitnami https://charts.bitnami.com/bitnami
# helm repo update
# helm repo list
# helm search repo bitnami
# helm show values bitnami/minio --version 12.6.4 > defaults/10-minio-defaults.yaml
# helm install minio -n minio --create-namespace https://charts.bitnami.com/bitnami --create-namespace minio ?????

resource "helm_release" "minio" {
  name = "minio"

  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "minio"
  namespace        = "bitnami"
  create_namespace = true
  version          = "12.6.4"

  values = [file("values/10-minio.yaml")]
}
