mkdir -p /auth_pam_tool_dir
apk add openrc
touch /auth_pam_tool_dir/auth_pam_tool
mkdir -p /run/mysqld

chown -R mysql:mysql /run/mysqld

sleep 200000
chown -R mysql:mysql /var/lib/mysql
mkdir -p /run/openrc/
touch /run/openrc/softlevel

# chown -R mysql:mysql /auth_pam_tool_dir
rm -rf /var/lib/mysql/*
mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql > /dev/null
rc-service mariadb setup



# #!/bin/sh
# #!/bin/sh

# 	# init database
# #mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql



# 	# https://stackoverflow.com/questions/10299148/mysql-error-1045-28000-access-denied-for-user-billlocalhost-using-passw

# 	# run init.sql

# # allow remote connections
# sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
# sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf
mysqld --initialize --user=mysql
mysql -u root -e "FLUSH PRIVILEGES;ALTER USER 'root'@'localhost';CREATE DATABASE WP ;CREATE USER 'USR'@'%' IDENTIFIED by 'PWD';GRANT ALL PRIVILEGES ON WP.* TO 'USR'@'%';"
#pkill mysqld
mysqld --user=mysql --console 
#mysqld --user=mysql --console

# Wait for the MySQL service to be ready

# Create the database