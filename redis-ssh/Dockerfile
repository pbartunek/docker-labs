FROM debian:sid-slim

RUN apt update && apt install -y \
    ca-certificates \
		dirmngr \
		gnupg \
    openssh-server \
    redis \
    && apt-get purge -y --auto-remove

RUN addgroup --gid 1337 redis \
  && adduser --disabled-password --uid 1337 --gid 1337 redis \
  && mkdir /home/redis/.ssh \
  && chown -R redis: /home/redis

COPY run.sh /

CMD /run.sh
