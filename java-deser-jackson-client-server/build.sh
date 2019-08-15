#!/bin/bash

cd app
rm *.class
javac -cp ".:classpath/*" *.java
cd .
