apk update

mv www.conf /etc/php81/php-fpm.d/

mkdir -p /var/www/html

adduser -D -G 'www-data' 'www-data'

cd /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# wget https://wordpress.org/latest.zip;

# unzip latest.zip 
mv /var/www/html/wp-cli.phar /bin/wp

chmod +x /bin/wp

mv /usr/sbin/php-fpm81 /bin/php-fpm


    wp core download --allow-root
# wait for mysql
while ! wp config create --dbname="WP" --dbuser="USR" --dbpass="PWD" --dbhost="mariadb" --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root > /dev/null
do    
    echo notfoubd;
    sleep 3
done
    wp core install --url=$DOMAIN_NAME/wordpress --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
    wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root
    wp theme install inspiro --activate --allow-root
    wp plugin install redis-cache --activate --allow-root
    wp plugin update --all --allow-root



echo "Wordpress started on :9000"

php-fpm -F -R