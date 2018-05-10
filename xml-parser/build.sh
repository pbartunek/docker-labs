#!/bin/bash

mkdir lib
cd lib
wget http://central.maven.org/maven2/org/apache/commons/commons-lang3/3.7/commons-lang3-3.7.jar
cd ..

cd app
jar -cvf ../app.war *
cd ..

