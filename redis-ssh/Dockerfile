FROM debian:sid-slim

RUN apt update && apt install -y \
    ca-certificates \
		dirmngr \
		gnupg \
    openssh-server \
    redis \
    && apt-get purge -y --auto-remove

RUN addgroup --gid 1337 test \
  && adduser --disabled-password --uid 1337 --gid 1337 test \
  && mkdir /home/test/.ssh \
  && chown -R test: /home/test

COPY run.sh /

CMD /run.sh
