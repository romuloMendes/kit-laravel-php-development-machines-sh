#!/usr/bin/env bash
# Author: Rômulo Mendes
# Description: Installs Ubunto 14.10 basics environment
# Usage: sudo bash ubunto-bootstrap.sh
# criado em 03/28/2015
trap "exit 1" ERR

# update distro
echo -e "\nUpdating distro...\n"
sudo apt-get clean all
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get install deborphan -y
sudo apt-get remove $(deborphan)
sudo apt-get -f install

# basic packages
echo -e "\nInstalling basic packages with apt-get...\n"
sudo sh -c -e "echo  'deb http://apt.postgresql.org/pub/repos/apt/ utopic-pgdg main' >> /etc/apt/sources.list.d/pgdg.list"
echo -e "\nInstalling postgresql...\n"
wget -q -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get -y install postgresql-9.4 pgadmin3
echo -e "\nInstalling git...\n"
sudo apt-get -y install git
echo -e "\nInstalling php...\n"
sudo apt-get -y install curl
sudo apt-get -y install php5
sudo apt-get -y install php5-pgsql
sudo apt-get -y install php5-mcrypt
sudo php5enmod mcrypt
echo -e "\nInstalling phpunit...\n"
sudo curl http://get.sensiolabs.org/php-cs-fixer.phar -o /usr/local/bin/php-cs-fixer
chmod +x /usr/local/bin/php-cs-fixer
echo -e "\nInstalling psysh (php repl)...\n"
sudo curl http://psysh.org/psysh -o /usr/local/bin/psysh
sudo chmod +x /usr/local/bin/psysh
echo -e "\nInstalling filezilla...\n"
sudo apt-get -y install filezilla
echo -e "\nInstalling composer...\n"
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
composer
composer --version