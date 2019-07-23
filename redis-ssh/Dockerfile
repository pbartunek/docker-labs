FROM debian:sid-slim

RUN apt update && apt install -y \
    ca-certificates \
		dirmngr \
		gnupg \
    openssh-server \
    redis \
    && apt-get purge -y --auto-remove

RUN addgroup --gid 1337 hackme \
  && adduser --disabled-password --uid 1337 --gid 1337 hackme \
  && mkdir /home/hackme/.ssh \
  && chown -R hackme: /home/hackme

COPY run.sh /

CMD /run.sh
#CMD /bin/sh
