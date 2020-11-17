#!/bin/bash


aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 737195575967.dkr.ecr.us-east-2.amazonaws.com

docker tag jmeter:5.3 737195575967.dkr.ecr.us-east-2.amazonaws.com/123:latest

docker push 737195575967.dkr.ecr.us-east-2.amazonaws.com/123:latest


