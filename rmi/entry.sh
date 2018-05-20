#!/bin/sh

java -Dcom.sun.management.jmxremote \
  -Dcom.sun.management.jmxremote.ssl=false \
  -Dcom.sun.management.jmxremote.authenticate=false \
  -Dcom.sun.management.jmxremote.port=8001 \
  -jar /app/test.jar 8080 &

java -Dcom.sun.management.jmxremote \
  -Dcom.sun.management.jmxremote=true \
  -Dcom.sun.management.jmxremote.port=8002 \
  -Dcom.sun.management.jmxremote.rmi.port=8002 \
  -Dcom.sun.management.jmxremote.ssl=false \
  -Djava.security.policy=client.policy \
  -Djava.security.manager \
  -Dcom.sun.management.jmxremote.password.file=jmxremote.password \
  -Dcom.sun.management.jmxremote.access.file=jmxremote.access \
  -jar /app/test.jar 8081 &

echo "Press q to exit"
while(true); do
  read input
  if [[ "$input" = "q" ]]; then
    exit 0
  fi
done
