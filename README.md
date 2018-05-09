# docker-labs

Set of vulnerable applications that can be build and run as Docker containers.

## Usage

### Building containers

Build all containers: `./build.sh`

Build only selected containers: `./build.sh CONTAINER_NAME1 CONTAINER_NAME2`

### Running

Run container in a background: `docker run -d -p 8080:8080 CONTAINER_NAME`

Run container with terminal attached: `docker run -ti -p 8080:8080 CONTAINER_NAME`

