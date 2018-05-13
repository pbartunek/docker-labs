FROM openjdk:7-jdk-alpine

ENV DOWNLOAD http://www.h2database.com/h2-2014-04-05.zip
ENV DATA_DIR /opt/h2-data

RUN mkdir -p $DATA_DIR && apk add --no-cache curl \
      && cd /tmp && curl ${DOWNLOAD} -o h2.zip \
      && unzip h2.zip -d /opt/ \
      && rm h2.zip

RUN adduser -s /bin/bash -u 1000 -g 1000 -D -h $DATA_DIR h2

EXPOSE 8080 1521

USER h2
WORKDIR $DATA_DIR

CMD java -cp /opt/h2/bin/h2*.jar org.h2.tools.Server \
  -web -webAllowOthers -webPort 8080 \
  -tcp -tcpAllowOthers -tcpPort 1521 \
  -baseDir ${DATA_DIR}
