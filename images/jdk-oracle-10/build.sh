#!/bin/bash
docker build -t svenruppert/jdk-oracle-10 .
docker push svenruppert/jdk-oracle-10:latest

docker tag svenruppert/jdk-oracle-10:latest svenruppert/jdk-oracle-10:1.10.0-2
docker push svenruppert/jdk-oracle-10:1.10.0-2

