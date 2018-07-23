#!/bin/bash
docker build -t svenruppert/jdk-oracle-08 .
docker push svenruppert/jdk-oracle-08:latest

docker tag svenruppert/jdk-oracle-08:latest svenruppert/jdk-oracle-08:1.8.181
docker push svenruppert/jdk-oracle-08:1.8.181

