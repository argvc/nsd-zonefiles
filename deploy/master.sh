#!/bin/sh

docker login -u $DOCKER_HOST -p $DOCKER_PASS
docker push argvc/nsd
ssh $DEPLOY_HOST docker stop argvc/nsd
ssh $DEPLOY_HOST docker pull argvc/nsd
ssh $DEPLOY_HOST docker run argvc/nsd
