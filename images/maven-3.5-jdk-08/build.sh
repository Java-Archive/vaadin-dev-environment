#!/bin/bash
docker build -t svenruppert/maven-3.5-jdk-08 .
docker push svenruppert/maven-3.5-jdk-08:latest

docker tag svenruppert/maven-3.5-jdk-08:latest svenruppert/maven-3.5-jdk-08:1.8.172-11
docker push svenruppert/maven-3.5-jdk-08:1.8.172-11
