# GitOps CD RAID Tutorial for Kubernetes

Requirements:
  - Kubernetes (Openshift) cluster
  - kubectl
  - kubeseal
  - Helm
  - Terraform
  - Ansible / Ansible Tower
  - ArgoCD
  - ArgoCD Image Updater [Optional]
  - Helm repository: ArtifactHub (open source: ChartMuseum and ChartMuseumUI)
  - Git repository (GitHub, open source: Gitea)
  - Docker Image Repository: DockerHub / Openshift Quay (Docker registry + Docker registry UI)
  - Terraform Registry (https://registry.terraform.io)
  - Spark


Useful Commands:
 - cd terraform & terraform init
 - terraform plan
 - terraform apply
 - cd ansible
 - pip install psycopg2

 - ansible-galaxy collection install community.kubernetes
 - ansible-playbook 1-port-forward.yaml --syntax-check
 - ansible-playbook 1-port-forward.yaml -i ~/.ansible/hosts
 - ansible-playbook 1-port-forward.yaml
 - ansible-playbook 2-database.yaml

- ssh-keyscan hostname >> ~/.ssh/known_hosts
- ssh-keygen -R hostname



Password:
  - argocd :
    user: admin
    password:
      kubectl get pods -n argocd -l app.kubernetes.io/name=argocd-server -o name | cut -d'/' -f 2
      kubectl exec -it argocd-server-75d9cd8848-gf8ll -n argocd -- argocd admin initial-password
      57fNJYndQ8fTglbT

  - ChartMuseum :
    user:
    password:

  - ChartMuseum UI :
    user:
    password:

  - Gitea :
    user: zem
    password: password123

  - Minio :
    user: admin            <<<  kubectl get secrets minio -n bitnami -o jsonpath='{.data.root-user}' | base64 --decode
    password: lJNWAMOdTw   <<<  kubectl get secrets minio -n bitnami -o jsonpath='{.data.root-password}' | base64 --decode

 - Spark :
