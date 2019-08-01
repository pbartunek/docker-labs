#!/bin/bash

/opt/jdk1.8.0_112/bin/java -Dcom.sun.management.jmxremote \
  -Dcom.sun.management.jmxremote.ssl=false \
  -Dcom.sun.management.jmxremote.authenticate=false \
  -Dcom.sun.management.jmxremote.port=8001 \
  -Djdk.serialFilter=java.* \
  -Dsun.rmi.registry.registryFilter=* \
  -jar /app/test.jar 8081 &

/opt/jdk1.8.0_112/bin/java -Dcom.sun.management.jmxremote \
  -Dcom.sun.management.jmxremote=true \
  -Dcom.sun.management.jmxremote.port=8002 \
  -Dcom.sun.management.jmxremote.rmi.port=8002 \
  -Dcom.sun.management.jmxremote.ssl=false \
  -Djava.security.policy=client.policy \
  -Djava.security.manager \
  -Dcom.sun.management.jmxremote.password.file=jmxremote.password \
  -Dcom.sun.management.jmxremote.access.file=jmxremote.access \
  -jar /app/test.jar 8082 &

/opt/jdk1.8.0_112/bin/java -Dcom.sun.management.jmxremote \
  -Dcom.sun.management.jmxremote.ssl=false \
  -Dcom.sun.management.jmxremote.authenticate=false \
  -Dcom.sun.management.jmxremote.port=8003 \
  -cp "/app/test.jar:/app/commons-collections-3.2.1.jar" \
  Test 8083 &

echo "Press q to exit"
while(true); do
  read input
  if [[ "$input" = "q" ]]; then
    exit 0
  fi
done
