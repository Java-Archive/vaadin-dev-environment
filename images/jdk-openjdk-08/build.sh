#!/bin/bash
docker build -t svenruppert/jdk-openjdk-08 .
docker push svenruppert/jdk-openjdk-08:latest

docker tag svenruppert/jdk-openjdk-08:latest svenruppert/jdk-openjdk-08:1.8.172-11
docker push svenruppert/jdk-openjdk-08:1.8.172-11
