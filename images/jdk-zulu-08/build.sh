#!/bin/bash
docker build -t svenruppert/jdk-zulu-08 .
docker push svenruppert/jdk-zulu-08:latest

docker tag svenruppert/jdk-zulu-08:latest svenruppert/jdk-zulu-08:1.8.172
docker push svenruppert/jdk-zulu-08:1.8.172

