#!/bin/bash
docker build -t svenruppert/maven-3.5-jdk-openjdk-09 .
docker push svenruppert/maven-3.5-jdk-openjdk-09:latest

docker tag svenruppert/maven-3.5-jdk-openjdk-09:latest svenruppert/maven-3.5-jdk-openjdk-09:1.9.0-4
docker push svenruppert/maven-3.5-jdk-openjdk-09:1.9.0-4
