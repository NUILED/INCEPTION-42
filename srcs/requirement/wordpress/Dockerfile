FROM alpine:3.18

WORKDIR ./

RUN apk update && apk add curl \
            php81  \
            php81-mysqli \
            php81-fpm  \
            php81-xml \
            php81-curl \
            php81-gd  \
            php81-json		\
            php81-mysqlnd		\
            php81-openssl		\
            php81-pdo			\
            php81-cli			\
            php81-pdo_mysql	\
            php81-pdo_pgsql	\
            php81-pdo_sqlite 	\
            php81-pgsql		\
            php81-phar		\
            php81-dom		\
            php81-posix		\
            php81-session		\
            php81-sockets		\
            php81-sodium		\
            php81-ctype		\
            php81-sqlite3		\
            php81-xsl			\
            php81-bz2			\
            php81-zip			\
            php81-zlib		\
            php81-iconv 	    \
            php81-gettext    \
            php81-opcache     \
            php81-pdo_odbc     \
            php81-gmp    \
            php81-fileinfo    \
            php81-pecl-imagick \
            php81-cgi           \
            fcgi

COPY ./tools/* ./

RUN chmod +x ./script.sh

EXPOSE 9000

CMD ["/bin/sh","./script.sh"]