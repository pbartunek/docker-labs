#!/bin/sh

cd server
java -Xdebug -Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=y SampleServer 127.0.0.1
cd ..
