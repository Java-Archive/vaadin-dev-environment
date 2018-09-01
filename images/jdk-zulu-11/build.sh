#!/bin/bash
docker build -t svenruppert/jdk-zulu-11 .
docker push svenruppert/jdk-zulu-11:latest

docker tag svenruppert/jdk-zulu-11:latest svenruppert/jdk-zulu-11:1.11.0
docker push svenruppert/jdk-zulu-11:1.11.0

