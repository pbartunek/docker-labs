FROM openjdk:11.0-jre

RUN mkdir /app

COPY ./app/ /app
COPY start-server.sh /
COPY commons-collections-3.2.1.jar /app

RUN addgroup --gid 1000 deser && adduser --shell /bin/bash --uid 1000 --gid 1000 --disabled-password deser
RUN chown -R deser: /app

USER deser

CMD ["/start-server.sh"]
