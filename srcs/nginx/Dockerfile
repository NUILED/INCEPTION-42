
FROM alpine:3.18

WORKDIR ./

COPY ./tools/* .

RUN chmod +x script.sh

RUN ./script.sh

EXPOSE 443

EXPOSE 80

CMD ["nginx", "-g" ,"daemon off;"]
