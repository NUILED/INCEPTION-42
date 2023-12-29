FROM alpine:3.18

WORKDIR ./

RUN apk add redis openrc

COPY ./tools/* ./

EXPOSE 6379

ENTRYPOINT ["/bin/sh","./script.sh"]