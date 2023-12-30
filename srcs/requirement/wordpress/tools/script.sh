
mv www.conf /etc/php81/php-fpm.d/

mkdir -p /var/www/html

adduser -D -G 'www-data' 'www-data'

cd /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

mv /var/www/html/wp-cli.phar /bin/wp

chmod +x /bin/wp

mv /usr/sbin/php-fpm81 /bin/php-fpm

if [ ! -f "wp-config.pwp" ]; then
    wp core download --allow-root
    wp config create --dbname="$MYSQL_DB" --dbuser="$MYSQL_USR" --dbpass="$MYSQL_PWD" --dbhost="$MYSQL_HOST" --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
    wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
    wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root
    wp plugin update --all --allow-root
fi

echo "Wordpress started on :9000"

/bin/php-fpm -F


