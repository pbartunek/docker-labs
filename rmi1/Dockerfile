FROM openjdk:7-alpine

RUN mkdir -p /app
COPY app/test.jar /app/test.jar

RUN adduser -h /home/rmi -s /bin/bash -u 1000 -g 1000 -D rmi
USER rmi

CMD java -Dcom.sun.management.jmxremote \
  -Dcom.sun.management.jmxremote.ssl=false \
  -Dcom.sun.management.jmxremote.authenticate=false \
  -Dcom.sun.management.jmxremote.port=8888 \
  -jar /app/test.jar
