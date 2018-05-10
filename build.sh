#!/bin/bash

function build() {
  local image=$1
  local dir=$2

  if [ -f "$dir/build.sh" ]; then
    echo "building application"
    cd $dir
    ./build.sh
    cd ..
  fi

  docker build --rm --force-rm -t $image $dir;

  echo "cleaning up"
  if [ -f "$dir/build.sh" ]; then
    cd $dir
    rm **/*.jar *.war 2> /dev/null
    rm -r lib 2> /dev/null
    cd ..
  fi
}

if [ -z "$1" ]; then
  echo "Building all images"
  for dir in ./*/
  do
    image=$(basename $dir);
    echo "Building image: ${image}";
    build $image $dir
  done
else
  for image in "$@"
  do
    if [[ -d "./${image}" ]]; then
      echo "Building ${image}"
      build $image "./${image}/"
    else
      echo "Could not find Dockerfile for image: ${image}, skipping.";
    fi
  done
fi
