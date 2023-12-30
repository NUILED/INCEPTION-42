FROM alpine:3.18

RUN apk add openrc && apk add --no-cache \
        mariadb \
        mariadb-client 
        
COPY ./conf /tmp/file

COPY ./tools/mariadb.sh ./

RUN chmod +x /mariadb.sh

RUN /bin/sh mariadb.sh

ENTRYPOINT ["/usr/bin/mysqld", "--user=mysql", "--console"]
