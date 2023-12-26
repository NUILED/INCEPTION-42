
apk update 

mkdir -p /www

adduser -D -g 'www' www

chown -R www:www /var/lib/nginx

chown -R www:www /www

apk add nginx

apk add openrc 

apk add openssl 

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout private.key -out certificate.crt -subj "/C=Ma/ST=KH/L=KH/O=1337/OU=1337/CN=aoutifra.1337.ma"

echo '1' > /var/run/nginx/nginx.pid

rm -rf /etc/nginx/nginx.conf

mv ./nginx.conf /etc/nginx/nginx.conf
