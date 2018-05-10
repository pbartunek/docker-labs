#!/bin/bash

mkdir lib
cd lib
wget http://central.maven.org/maven2/commons-codec/commons-codec/1.11/commons-codec-1.11.jar \
  http://central.maven.org/maven2/commons-io/commons-io/2.6/commons-io-2.6.jar \
  http://central.maven.org/maven2/commons-fileupload/commons-fileupload/1.3.3/commons-fileupload-1.3.3.jar
cd ..


cd app
jar -cvf ../app.war *
cd ..
