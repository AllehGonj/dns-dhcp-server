# ENVIRONMENT

SERVER_NET=redes-uptc

SRV_DOCKERFILE_NAME=dns.Dockerfile
SRV_IMAGE_NAME=bind9
SRV_CONTAINER_NAME=dns-server

HOST_DOCKERFILE_NAME=host.Dockerfile
HOST_IMAGE_NAME=host-bind9

DNS_SERVER_IP=172.20.0.2

# DOCKER TASKS

net: ## Create local docker network to allow run containers with static IP
	docker network create --subnet=172.20.0.0/16 $(SERVER_NET)

build-srv: ## Build the server container
	docker build -f $(SRV_DOCKERFILE_NAME) -t $(SRV_IMAGE_NAME) .

build-host: ## Build the host container
	docker build -f $(HOST_DOCKERFILE_NAME) -t $(HOST_IMAGE_NAME) .

run-srv: ## Run container on server net with static IP
	docker run -d --rm --name=$(SRV_CONTAINER_NAME) --net=$(SERVER_NET) --ip=$(DNS_SERVER_IP) $(SRV_IMAGE_NAME)

start-bind: ## Enable Bind9 daemon
	docker exec -d $(SRV_CONTAINER_NAME) /etc/init.d/bind9 start

run-host1: ## Run host 1 container
	docker run -d --rm --name=host1 --net=$(SERVER_NET) --ip=172.20.0.3 --dns=$(DNS_SERVER_IP) $(HOST_IMAGE_NAME) /bin/bash -c "while :; do sleep 10; done"

run-host2: ## Run host 2 container
	docker run -d --rm --name=host2 --net=$(SERVER_NET) --ip=172.20.0.4 --dns=$(DNS_SERVER_IP) $(HOST_IMAGE_NAME) /bin/bash -c "while :; do sleep 10; done"

stop-server: ## Stop and remove a running container
	docker stop $(SRV_CONTAINER_NAME)
