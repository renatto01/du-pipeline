#!/bin/bash

cmd01="kubectl port-forward service/argocd-server 30100:80 -n argocd"
cmd03="kubectl port-forward service/chartmuseum 30300:8080 -n chartmuseum"
cmd05="kubectl port-forward service/gitea-http 30500:3000 -n gitea"
cmd06="kubectl port-forward service/docker-registry 30600:5000 -n twuni"
cmd07="kubectl port-forward service/docker-registry-ui-docker-registry-ui-user-interface 30700:80 -n joxit"
cmd09="kubectl port-forward service/postgresql 30900:5432 -n bitnami"
cmd10a="kubectl port-forward service/minio 31900:9000 -n bitnami"
cmd10b="kubectl port-forward service/minio 31901:9001 -n bitnami"
cmd11a="kubectl port-forward service/spark-master-svc 31077:7077 -n bitnami"
cmd11b="kubectl port-forward service/spark-master-svc 31180:80 -n bitnami"


eval "${cmd01}" &>/dev/null & disown;
eval "${cmd03}" &>/dev/null & disown;
eval "${cmd05}" &>/dev/null & disown;
eval "${cmd06}" &>/dev/null & disown;
eval "${cmd07}" &>/dev/null & disown;
eval "${cmd09}" &>/dev/null & disown;
eval "${cmd10a}" &>/dev/null & disown;
eval "${cmd10b}" &>/dev/null & disown;
eval "${cmd11a}" &>/dev/null & disown;
eval "${cmd11b}" &>/dev/null & disown;
