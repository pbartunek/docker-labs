FROM openjdk:11-jre-slim

RUN mkdir /server
COPY ./server/ /server
COPY start-server.sh /server

RUN apt-get update && apt install netcat-traditional && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN addgroup --gid 1337 jdwp && \ 
  adduser --home /usr/local/jdwp --shell /bin/bash -uid 1337 -gid 1337 --disabled-password jdwp && \
  chown -R jdwp: /usr/local/jdwp/

EXPOSE 8080
EXPOSE 8000
USER jdwp

CMD ["/server/start-server.sh"]
