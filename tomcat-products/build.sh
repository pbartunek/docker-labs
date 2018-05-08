#!/bin/bash

echo ${BASH_SOURCE[0]}

cd app
jar -cvf ../app.war *
cd ..

cd exporter
javac -cp "../lib/*" *.java
jar cvfm exporter.jar MANIFEST.MF Exporter.class
rm *.class
cd ..
