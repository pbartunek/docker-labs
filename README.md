# docker-labs

Set of vulnerable applications that can be build and run as Docker containers.

## Usage

### Building containers

Build all containers: `./build.sh`

Build only selected containers: `./build.sh CONTAINER_NAME1 [CONTAINER_NAME2]`

### Running

Run container in a background: `docker run -d -p 8080:8080 CONTAINER_NAME`

Run container with terminal attached: `docker run -ti -p 8080:8080 CONTAINER_NAME`

## Warning!

This repository contains intentionally vulnerable applications *do not use these containers on Internet facing servers*. It is recommended to use them in separated  environment such as Virtual Machine with Host Only/NAT networking mode.

