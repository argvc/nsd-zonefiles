#!/bin/sh

docker login -e $DOCKER_EMAIL -u $DOCKER_ID -p $DOCKER_PASS
docker push argvc/nsd
ssh $DEPLOY_HOST -i ~/.ssh/id_deploy -l $DEPLOY_USER docker pull argvc/nsd
ssh $DEPLOY_HOST -i ~/.ssh/id_deploy -l $DEPLOY_USER docker stop nsd 2 > /dev/null || true
ssh $DEPLOY_HOST -i ~/.ssh/id_deploy -l $DEPLOY_USER docker rm nsd 2 > /dev/null || true
ssh $DEPLOY_HOST -i ~/.ssh/id_deploy -l $DEPLOY_USER docker run -d --net=host --name nsd -p 53:53 argvc/nsd nsd
