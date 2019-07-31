FROM openjdk:7-alpine

RUN mkdir -p /app
COPY app/test.jar /app/test.jar
COPY commons-collections-3.2.1.jar /app/commons-collections-3.2.1.jar
COPY conf/* /app/
COPY entry.sh /app/

RUN adduser -h /home/rmi -s /bin/bash -u 1000 -g 1000 -D rmi
RUN chown -R rmi: /app
RUN chmod 600 /app/jmxremote.*
USER rmi
WORKDIR /app

ENTRYPOINT /app/entry.sh
