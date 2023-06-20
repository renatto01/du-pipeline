# taken from https://www.jenkins.io/doc/book/installing/docker/

# create a bridge network
docker network create jenkins

# In order to execute Docker commands inside Jenkins nodes, download and run the docker:dind Docker image
docker run \
  --name jenkins-docker \
  --rm \
  --detach \
  --privileged \
  --network jenkins \
  --network-alias docker \
  --env DOCKER_TLS_CERTDIR=/certs \
  --volume jenkins-docker-certs:/certs/client \
  --volume jenkins-data:/var/jenkins_home \
  --publish 2376:2376 \
  --publish 3000:3000 --publish 5000:5000 \
  docker:dind \
  --storage-driver overlay2

# If above does not work, try this annotation-free version here:
#docker run --name jenkins-docker --rm --detach \
#  --privileged --network jenkins --network-alias docker \
#  --env DOCKER_TLS_CERTDIR=/certs \
#  --volume jenkins-docker-certs:/certs/client \
#  --volume jenkins-data:/var/jenkins_home \
#  --publish 3000:3000 --publish 5000:5000 --publish 2376:2376 \
#  docker:dind --storage-driver overlay2


# Customise official Jenkins Docker image (check dockerfile):
docker build -t myjenkins-blueocean:2.401.1-1 .


# Run our own myjenkins-blueocean:2.401.1-1 image as a container in Docker:
docker run \
  --name jenkins-blueocean \
  --detach \
  --network jenkins \
  --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client \
  --env DOCKER_TLS_VERIFY=1 \
  --publish 8080:8080 \
  --publish 50000:50000 \
  --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro \
  --volume "$HOME":/home \
  --restart=on-failure \
  --env JAVA_OPTS="-Dhudson.plugins.git.GitSCM.ALLOW_LOCAL_CHECKOUT=true" \
  myjenkins-blueocean:2.401.1-1

# if previous does not work:
#docker run --name jenkins-blueocean --detach \
#  --network jenkins --env DOCKER_HOST=tcp://docker:2376 \
#  --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 \
#  --publish 8080:8080 --publish 50000:50000 \
#  --volume jenkins-data:/var/jenkins_home \
#  --volume jenkins-docker-certs:/certs/client:ro \
#  --volume "$HOME":/home \
#  --restart=on-failure \
#  --env JAVA_OPTS="-Dhudson.plugins.git.GitSCM.ALLOW_LOCAL_CHECKOUT=true" \
#  myjenkins-blueocean:2.401.1-1


# Post-installation setup wizard
# 1. Browse http://localhost:8080
# 2. sudo docker exec ${CONTAINER_ID or CONTAINER_NAME} cat /var/jenkins_home/secrets/initialAdminPassword
#    sudo docker exec jenkins-blueocean cat /var/jenkins_home/secrets/initialAdminPassword
#    ec590f8804134ab2adc128c9d1bb750a

# username: zem
# password: password
# Jenkins URL: http://localhost:8080/


# To access Blue Oceans Pipelines
http://localhost:8080/blue/




docker logs jenkins-blueocean
