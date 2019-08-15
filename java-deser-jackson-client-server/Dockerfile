FROM openjdk:11.0-jre

RUN mkdir /app
COPY ./app/ /app

RUN addgroup --gid 1000 deser && adduser --shell /bin/bash --uid 1000 --gid 1000 --disabled-password deser && \
  chown -R deser: /app

USER deser

WORKDIR "/app"
ENTRYPOINT ["java", "-cp", ".:classpath/*", "Server", "8090"]
