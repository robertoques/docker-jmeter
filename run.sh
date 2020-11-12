#!/bin/bash
#
# Run JMeter Docker image with options

NAME="jmeter4"
IMAGE="robertonivel4/jmeter:5.3"

TARGET_HOST="sec.rober.xyz"
TARGET_PORT="80"
TARGET_PATH="/"
TARGET_KEYWORD="RBAC:"
TARGET_THREADS="100"

sudo docker stop ${NAME} > /dev/null 2>&1
sudo docker rm ${NAME} > /dev/null 2>&1
sudo docker run --name ${NAME} -i ${IMAGE} -e TARGET_HOST=${TARGET_HOST} -e TARGET_PORT=${TARGET_PORT} -e TARGET_PATH=${TARGET_PATH} -e TARGET_KEYWORD=${TARGET_KEYWORD} -e "THREADS=100"
