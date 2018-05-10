#!/bin/bash

echo ${BASH_SOURCE[0]}

mkdir lib
cd lib
wget http://central.maven.org/maven2/org/apache/commons/commons-lang3/3.7/commons-lang3-3.7.jar \
http://central.maven.org/maven2/com/github/javafaker/javafaker/0.15/javafaker-0.15.jar \
http://central.maven.org/maven2/org/yaml/snakeyaml/1.21/snakeyaml-1.21.jar
cd ..

cd app
jar -cvf ../app.war *
cd ..

cd exporter
javac -cp "../lib/*" *.java
jar cvfm exporter.jar MANIFEST.MF Exporter.class
rm *.class
cd ..
