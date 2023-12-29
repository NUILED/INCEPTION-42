FROM alpine:3.18

RUN apk add openrc && apk add --no-cache \
        mariadb \
        mariadb-client \
        openrc
        
COPY tools/* /tmp/

ENTRYPOINT ["sh","/tmp/script.sh"]