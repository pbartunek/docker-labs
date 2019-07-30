#!/bin/sh

cd /server
java -agentlib:jdwp=transport=dt_socket,address=*:8000,server=y,suspend=n SampleServer
#java -Xdebug -Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=n SampleServer 127.0.0.1
