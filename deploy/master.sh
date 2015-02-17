#!/bin/sh

docker login -e $DOCKER_EMAIL -u $DOCKER_HOST -p $DOCKER_PASS
docker push argvc/nsd
ssh $DEPLOY_HOST -i ~/.ssh/deploy -l $DEPLOY_USER docker stop argvc/nsd
ssh $DEPLOY_HOST -i ~/.ssh/deploy -l $DEPLOY_USER docker pull argvc/nsd
ssh $DEPLOY_HOST -i ~/.ssh/deploy -l $DEPLOY_USER docker run -d -p 53:53 argvc/nsd nsd 
