#!/bin/bash
docker build -t svenruppert/maven-3.5-jdk-oracle-08 .
docker push svenruppert/maven-3.5-jdk-oracle-08:latest

docker tag svenruppert/maven-3.5-jdk-oracle-08:latest svenruppert/maven-3.5-jdk-oracle-08:1.8.172
docker push svenruppert/maven-3.5-jdk-oracle-08:1.8.172

