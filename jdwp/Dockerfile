FROM openjdk:alpine

RUN mkdir /server

COPY ./server/ /server
COPY start_server.sh /

RUN adduser -h /usr/local/jdwp -s /bin/bash -u 1337 -g 1337 -D jdwp
RUN chown -R jdwp: /usr/local/jdwp/

EXPOSE 8080
EXPOSE 8000
USER jdwp

CMD ["/start_server.sh"]
