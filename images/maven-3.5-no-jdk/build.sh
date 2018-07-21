#!/bin/bash
docker build -t svenruppert/maven-3.5-no-jdk .

docker push svenruppert/maven-3.5-no-jdk:latest
docker tag svenruppert/maven-3.5-no-jdk:latest svenruppert/maven-3.5-no-jdk:maven-3.5.4
docker push svenruppert/maven-3.5-no-jdk:maven-3.5.4

