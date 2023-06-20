# helm repo add joxit https://helm.joxit.dev
# helm repo update
# helm repo list
# helm search repo joxit
# helm show values joxit/docker-registry-ui --version 1.0.1 > defaults/07-docker-registry-ui-defaults.yaml
# helm upgrade --install joxit/docker-registry-ui -n docker-registry-ui --create-namespace joxit/docker-registry-ui --version 1.0.1 -f terraform/values/07-docker-registry-ui.yaml

resource "helm_release" "docker_registry_ui" {
  name = "docker-registry-ui"

  repository       = "https://helm.joxit.dev/"
  chart            = "docker-registry-ui"
  namespace        = "joxit"
  create_namespace = true
  version          = "1.0.1"

  values = [file("values/07-docker-registry-ui.yaml")]
}
