#!/bin/bash
docker build -t svenruppert/jdk-openjdk-10 .
docker push svenruppert/jdk-openjdk-10:latest

docker tag svenruppert/jdk-openjdk-10:latest svenruppert/jdk-openjdk-10:1.10.2
docker push svenruppert/jdk-openjdk-10:1.10.2

