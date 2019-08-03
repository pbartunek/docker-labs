#!/bin/bash

cd app
rm *.class
javac Message.java Server.java Client.java
cd .
