# helm repo add chartmuseum https://chartmuseum.github.io/charts
# helm repo update
# helm repo list
# helm search repo chartmuseum
# helm show values chartmuseum/chartmuseum --version 3.9.3 > defaults/03-chartmuseum-defaults.yaml
# helm install chartmuseum -n chartmuseum --create-namespace chartmuseum/chartmuseum --version 3.9.3 -f terraform/values/03-chartmuseum.yaml

resource "helm_release" "chartmuseum" {
  name = "chartmuseum"

  repository       = "https://chartmuseum.github.io/charts"
  chart            = "chartmuseum"
  namespace        = "chartmuseum"
  create_namespace = true
  version          = "3.9.3"

  values = [file("values/03-chartmuseum.yaml")]
}
