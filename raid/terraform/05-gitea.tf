# helm repo add gitea-charts https://dl.gitea.io/charts/
# helm repo update
# helm repo list
# helm search repo gitea-charts
# helm show values gitea-charts/gitea --version 8.3.0 > defaults/05-gitea-defaults.yaml
# helm install gitea -n gitea --create-namespace gitea-charts/gitea-charts --version 8.3.0 -f terraform/values/05-gitea.yaml

resource "helm_release" "gitea" {
  name = "gitea"

  repository       = "https://dl.gitea.io/charts/"
  chart            = "gitea"
  namespace        = "gitea"
  create_namespace = true
  version          = "8.3.0"

  values = [file("values/05-gitea.yaml")]
}
