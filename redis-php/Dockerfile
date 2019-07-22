FROM php:7.2-apache

RUN apt update && apt install -y \
    ca-certificates \
		dirmngr \
		gnupg \
    redis \
    && apt-get purge -y --auto-remove 

ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

COPY src/ /var/www/html/
COPY apache.conf /etc/apache2/apache.conf
COPY ports.conf /etc/apache2/ports.conf
COPY run.sh /

EXPOSE 8080
EXPOSE 6379

CMD /run.sh
