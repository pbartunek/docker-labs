#!/bin/sh

redis-server --protected-mode no &
/usr/sbin/apache2ctl -D FOREGROUND
