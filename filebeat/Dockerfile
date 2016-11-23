FROM alpine:3.4
MAINTAINER Loggi <dev@loggi.com>

ENV FILEBEAT_VERSION=1.3.0

RUN apk add --no-cache curl tar
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2 && \
    curl -sL "https://download.elastic.co/beats/filebeat/filebeat-${FILEBEAT_VERSION}-x86_64.tar.gz" | tar xz --strip-components=1 -C /tmp && \
    cp /tmp/filebeat /bin && \
    rm -rf /tmp/* && \
    mkdir /etc/filebeat

ADD     filebeat.yml /etc/filebeat
WORKDIR /etc/filebeat
CMD [ "filebeat", "-e", "-v"]
