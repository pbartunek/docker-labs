#!/bin/bash

cd app
rm *.class
javac -source 6 -target 6 Test.java
jar cvfm test.jar MANIFEST.mf Test.class
rm *.class
