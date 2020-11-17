#!/bin/bash
# Inspired from https://github.com/hhcordero/docker-jmeter-client

set -e

freeMem=`awk '/MemFree/ { print int($2/1024) }' /proc/meminfo`
s=$(($freeMem/10*8))
x=$(($freeMem/10*8))
n=$(($freeMem/10*2))
export JVM_ARGS="-Xmn${n}m -Xms${s}m -Xmx${x}m"

echo "START Running Jmeter on `date`"

echo "JVM_ARGS=${JVM_ARGS}"

wget $URL_JMX -O /tmp/plan.jmx

jmeter -Dlog_level.jmeter=DEBUG -JTARGET_HOST=${TARGET_HOST} -JTARGET_PORT=${TARGET_PORT} -JTARGET_PATH=${TARGET_PATH} -JTARGET_KEYWORD=${TARGET_KEYWORD} -JTHREADS=${TARGET_THREADS} -n -t /tmp/plan.jmx -l /tmp/test-plan.jtl -j /tmp/jmeter.log 

echo "END Running Jmeter on `date`"
