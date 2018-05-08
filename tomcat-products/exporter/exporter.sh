#!/bin/sh

tempPath=$1
tempFile=$2
outPath=$3
outFile=$(echo "$4" | sed -e 's/\./_/g')

cd $tempPath
/bin/sh -c "java -jar /usr/local/tomcat/lib/exporter.jar \
  $tempPath '$tempFile' $outPath \"$outFile\""
