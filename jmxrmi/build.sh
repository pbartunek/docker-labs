#!/bin/bash

cd app
rm *.class
javac -cp ../commons-collections-3.2.1.jar -source 6 -target 6 Test.java
jar cvfm test.jar MANIFEST.mf *.class
rm *.class
