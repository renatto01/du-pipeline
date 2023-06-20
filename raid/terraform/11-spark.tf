# helm repo add bitnami https://charts.bitnami.com/bitnami
# helm repo update
# helm repo list
# helm search repo bitnami
# helm show values bitnami/spark --version 7.0.1 > defaults/11-spark-defaults.yaml
# helm install spark -n spark --create-namespace https://charts.bitnami.com/spark --create-namespace spark ?????

resource "helm_release" "spark" {
  name = "spark"

  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "spark"
  namespace        = "bitnami"
  create_namespace = true
  version          = "7.0.1"

  values = [file("values/11-spark.yaml")]
}
