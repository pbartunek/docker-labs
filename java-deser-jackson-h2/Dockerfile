FROM jruby:9-jdk-alpine

WORKDIR /app

COPY app/* /app/
RUN mkdir -p /app/classpath && cd /app/classpath \ 
  && wget -q http://central.maven.org/maven2/com/fasterxml/jackson/core/jackson-databind/2.9.8/jackson-databind-2.9.8.jar \
  http://central.maven.org/maven2/com/fasterxml/jackson/core/jackson-annotations/2.9.8/jackson-annotations-2.9.8.jar \
  http://central.maven.org/maven2/com/fasterxml/jackson/core/jackson-core/2.9.8/jackson-core-2.9.8.jar \
  http://central.maven.org/maven2/ch/qos/logback/logback-core/1.3.0-alpha4/logback-core-1.3.0-alpha4.jar \
  http://central.maven.org/maven2/com/h2database/h2/1.4.199/h2-1.4.199.jar

RUN adduser -s /bin/bash -u 1000 -g 1000 -D -h /home/test test
RUN chown -R test: /app

USER test

CMD ["/bin/sh"]
