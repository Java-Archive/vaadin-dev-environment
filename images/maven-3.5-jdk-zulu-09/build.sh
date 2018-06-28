#!/bin/bash
docker build -t svenruppert/maven-3.5-jdk-zulu-09 .
docker push svenruppert/maven-3.5-jdk-zulu-09:latest

docker tag svenruppert/maven-3.5-jdk-zulu-09:latest svenruppert/maven-3.5-jdk-zulu-09:1.9.0-7
docker push svenruppert/maven-3.5-jdk-zulu-09:1.9.0-7

