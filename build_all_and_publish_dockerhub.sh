#!/bin/bash
[ -z "$1" ] && echo "Please enter your DockerHub username, example: sh build_all_and_publish_dockerhub.sh username" && exit 1
echo "dockerhub\`s username: $1"

cd shopfront
/opt/maven/bin/mvn clean install
if docker build -t $1/djshopfront . ; then
  docker push sahuprateek87/djshopfront
fi
cd ..

cd productcatalogue
/opt/maven/bin/mvn clean install
if docker build -t $1/djproductcatalogue . ; then
  docker push sahuprateek87/djproductcatalogue
fi
cd ..

cd stockmanager
/opt/maven/bin/mvn clean install
if docker build -t $1/djstockmanager . ; then
  docker push sahuprateek87/djstockmanager
fi
cd ..
