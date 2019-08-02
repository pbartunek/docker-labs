FROM openjdk:11.0-jre

# Java deserialization lab, based on:
# https://github.com/NickstaDB/DeserLab
#

ENV DOWNLOAD https://github.com/NickstaDB/DeserLab/releases/download/v1.0/DeserLab-v1.0.zip
ENV DATA_DIR /opt/deser-lab

RUN mkdir -p $DATA_DIR && apt-get update && apt-get install -y wget
RUN cd /tmp && wget -q ${DOWNLOAD} \
      && unzip DeserLab-v1.0.zip -d /opt/ \
      && rm DeserLab-v1.0.zip

RUN addgroup --gid 1000 deser && adduser --shell /bin/bash --uid 1000 --gid 1000 --disabled-password --home $DATA_DIR deser


USER deser
WORKDIR $DATA_DIR

CMD java -jar /opt/DeserLab-v1.0/DeserLab.jar \
  -server 0.0.0.0 8888
