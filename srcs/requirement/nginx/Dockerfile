
FROM alpine:3.18

WORKDIR ./

COPY ./tools/* .

RUN apk update && apk add openrc \
            nginx \
            openssl 

RUN chmod +x script.sh

RUN ./script.sh

EXPOSE 443

CMD ["nginx", "-g" ,"daemon off;"]
