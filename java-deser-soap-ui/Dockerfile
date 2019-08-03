FROM openjdk:8-jre

RUN apt-get update && apt install libxext6 libxrender1 libxtst6 -y

# Download and unarchive SoapUI
RUN mkdir -p /opt && \
    curl http://dl.eviware.com/soapuios/5.2.1/SoapUI-x64-5.2.1.sh -o /opt/SoapUI-x64-5.2.1.sh \
    && sh /opt/SoapUI-x64-5.2.1.sh -q && rm /opt/SoapUI-x64-5.2.1.sh

RUN addgroup --gid 1337 soap
RUN adduser --uid 1337 --gid 1337 --home /home/soap --disabled-password soap
USER soap

# Set environment
ENV PATH ${PATH}:/opt/SmartBear/SoapUI-5.2.1/bin

WORKDIR /opt/SmartBear/SoapUI-5.2.1/

ENTRYPOINT ["/opt/SmartBear/SoapUI-5.2.1/bin/soapui.sh"]
