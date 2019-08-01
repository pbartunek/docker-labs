FROM debian:stretch-slim

RUN mkdir -p /app
COPY app/test.jar /app/test.jar
COPY commons-collections-3.2.1.jar /app/commons-collections-3.2.1.jar
COPY conf/* entry.sh /app/

COPY jdk/jdk-8u112-linux-x64.tar.gz /opt
RUN cd /opt && tar xf jdk-8u112-linux-x64.tar.gz && rm jdk-8u112-linux-x64.tar.gz

RUN addgroup --gid 1000 rmi && adduser --home /home/rmi --shell /bin/bash --uid 1000 --gid 1000 --disabled-password rmi
RUN chown -R rmi: /app
RUN chmod 600 /app/jmxremote.*
USER rmi
WORKDIR /app

ENTRYPOINT /app/entry.sh
