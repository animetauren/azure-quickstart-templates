#!/bin/bash
yum update -y

clear

echo 'Going to install the LAMP stack on your machine, here we go...'
echo '------------------------'

# set up a silent install of MySQL
dbpass=$1

# install the LAMP stack
yum install -y httpd php php-mysql mysql mysql-server

chkconfig httpd on
chkconfig mysql-server on
/etc/init.d/mysqld restart

/usr/bin/mysqladmin -u root password $dbpass

# write some PHP
echo -e "<?php phpinfo(); ?>" > /var/www/html/index.php

service httpd restart

clear
echo 'Okay.... apache, php and mysql is installed, running and set to your desired password'
