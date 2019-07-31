#!/bin/sh

service apache2 start
redis-server --protected-mode no
