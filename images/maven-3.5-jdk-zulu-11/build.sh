#!/bin/bash
docker build -t svenruppert/maven-3.5-jdk-zulu-11 .
docker push svenruppert/maven-3.5-jdk-zulu-11:latest

docker tag svenruppert/maven-3.5-jdk-zulu-11:latest svenruppert/maven-3.5-jdk-zulu-11:1.11.0
docker push svenruppert/maven-3.5-jdk-zulu-11:1.11.0

