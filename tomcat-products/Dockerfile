FROM tomcat:alpine

COPY ./app.war /usr/local/tomcat/webapps/ROOT.war
COPY ./lib/ /usr/local/tomcat/lib
copy ./exporter/exporter.jar /usr/local/tomcat/lib
copy ./exporter/exporter.sh /usr/local/tomcat/bin

RUN rm -rf /usr/local/tomcat/webapps/ROOT \
  && rm -rf /usr/local/tomcat/webapps/examples

RUN adduser -h /usr/local/tomcat -s /bin/bash -u 1000 -g 1000 -D tomcat
RUN chown -R tomcat: /usr/local/tomcat/

EXPOSE 8080
USER tomcat

CMD ["catalina.sh", "run"]
