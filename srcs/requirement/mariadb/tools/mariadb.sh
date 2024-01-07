mkdir -p /auth_pam_tool_dir
mkdir -p /run/openrc/
mkdir -p /run/mysqld

touch /auth_pam_tool_dir/auth_pam_tool

touch /run/openrc/softlevel

chown -R mysql:mysql /run/mysqld

chown -R mysql:mysql /var/lib/mysql

mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql

rc-service mariadb setup

mysqld --user=mysql --bootstrap < /tmp/file

sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

