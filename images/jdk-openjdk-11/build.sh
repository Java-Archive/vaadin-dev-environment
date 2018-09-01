#!/bin/bash
docker build -t svenruppert/jdk-openjdk-11 .
docker push svenruppert/jdk-openjdk-11:latest

docker tag svenruppert/jdk-openjdk-11:latest svenruppert/jdk-openjdk-11:1.11.0-28
docker push svenruppert/jdk-openjdk-11:1.11.0-28

