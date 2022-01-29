#! /bin/bash -e

SCRIPT_DIR=$(cd $( dirname "${BASH_SOURCE[0]}" ) ; pwd)

docker-compose -f $SCRIPT_DIR/../docker-compose-registry.yml --project-name eventuate-common-registry up -d registry

docker buildx build --platform linux/amd64,linux/arm64 \
  -t host.docker.internal:5002/eventuate-mysql8:multi-arch-local-build \
  -f $SCRIPT_DIR/Dockerfile-mysql8 \
  --output=type=image,push=true,registry.insecure=true \
  $SCRIPT_DIR