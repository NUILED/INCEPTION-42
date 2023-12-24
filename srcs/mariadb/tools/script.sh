mkdir -p /auth_pam_tool_dir
apk add openrc
touch /auth_pam_tool_dir/auth_pam_tool
mkdir -p /run/mysqld

chown -R mysql:mysql /run/mysqld

chown -R mysql:mysql /var/lib/mysql
mkdir -p /run/openrc/
touch /run/openrc/softlevel

# chown -R mysql:mysql /auth_pam_tool_dir
#mysql_secure_installation --basedir=/usr --datadir=/var/lib/mysql --user=mysql 
rc-service mariadb setup
echo "USE mysql;
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'PWD';
CREATE DATABASE WP CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER 'USR'@'%' IDENTIFIED by 'PWD';
GRANT ALL PRIVILEGES ON WP.* TO 'USR'@'%';
FLUSH PRIVILEGES;" > /tmp/file

mysqld --user=mysql --bootstrap < /tmp/file

# #!/bin/sh
# #!/bin/sh

# 	# init database
# #mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql



# 	# https://stackoverflow.com/questions/10299148/mysql-error-1045-28000-access-denied-for-user-billlocalhost-using-passw

# 	# run init.sql

# # allow remote connections
sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
 sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf
mysqld --user=mysql --console 
#mysqld --user=mysql --console

# Wait for the MySQL service to be ready

# Create the database