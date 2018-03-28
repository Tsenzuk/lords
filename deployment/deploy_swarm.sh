#!/bin/bash
echo "--- UPDATE CODE ---"
git pull

# Load env vars
export $(cat .env | xargs)

# Push image to the local registry
echo "--- PUSH IMAGE TO LOCAL REGISTRY ---"
docker service create --name registry --publish published=5000,target=5000 registry:2
docker-compose -f docker-compose.prod.yml build
docker-compose -f docker-compose.prod.yml push

# Deploy stack to swarm
echo "--- DEPLOY DOCKER STACK ---"
# Don't resolve image because ape uses i386 architecture
docker stack deploy --compose-file docker-compose.prod.yml --resolve-image=never lords

# Run migrations
echo "--- RUN MIGRATIONS ---"
sleep 5 # wait db service is updated for sure
# Run init only the first time
# docker exec -it $(docker ps -q -f name=lords_db) /database/bin/lords_db_init.sh
docker exec -it $(docker ps -q -f name=lords_db) /database/bin/lords_db_migrate.sh

# Shut down registry
echo "--- SHUT DOWN REGISTRY ---"
docker service rm registry