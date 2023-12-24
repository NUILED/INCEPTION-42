FROM alpine:3.18

WORKDIR ./

COPY ./tools/* ./

RUN apk add php-mysqli \
            php-xml \
            php-curl \
            php-gd php-zip \
            curl php  \
            php-fpm  \
            php-phar \
            php-json		\
            php-mysqli		\
            php-mysqlnd		\
            php-openssl		\
            php-pdo			\
            php-gd			\
            php-cli			\
            php-pdo_mysql	\
            php-pdo_pgsql	\
            php-pdo_sqlite 	\
            php-pgsql		\
            php-phar		\
            php-posix		\
            php-session		\
            php-sockets		\
            php-sodium		\
            php-sqlite3		\
            php-xsl			\
            php-zip			\
            php-zlib		\
            php-iconv 	    \
            php-opcache     \
            mariadb 

RUN chmod +x ./script.sh

EXPOSE 9000

CMD ["/bin/sh","script.sh"]