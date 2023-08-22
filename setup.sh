#!/bin/bash
sudo apt update && sudo apt upgrade -y 
sudo apt -y install apache2 mariadb-server php php-mysqli php-gd libapache2-mod-php net-tools

#preparing the database
#create a database dvwa
sudo mysql -u root -e "create database dvwa;"
#create a user dvwa with password password
sudo mysql -u root -e "create user dvwa@localhost identified by 'password';"
#grant all privileges to dvwa
sudo mysql -u root -e "grant all privileges on dvwa.* to dvwa@localhost identified by 'password';"

cd /var/www/html
sudo rm ./*
sudo git clone https://github.com/digininja/DVWA.git .
sudo chown -R www-data:www-data /var/www/html/*
cp /var/www/html/config/config.inc.php.dist /var/www/html/config/config.inc.php
sudo sed -i 's/^\(db_password.*=\).*$/\1 '\''password'\'';/' /var/www/html/config/config.inc.php

sudo systemctl enable apache2
sudo systemctl start apache2