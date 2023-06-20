# helm repo add twuni https://helm.twun.io
# helm repo update
# helm repo list
# helm search repo twuni
# helm show values twuni/docker-registry --version 2.2.2 > defaults/06-docker-registry-defaults.yaml
# helm install twuni/docker-registry -n docker-registry --create-namespace twuni/docker-registry --version 2.2.2 -f terraform/values/06-docker-registry.yaml

resource "helm_release" "docker_registry" {
  name = "docker-registry"

  repository       = "https://helm.twun.io/"
  chart            = "docker-registry"
  namespace        = "twuni"
  create_namespace = true
  version          = "2.2.2"

  values = [file("values/06-docker-registry.yaml")]
}
