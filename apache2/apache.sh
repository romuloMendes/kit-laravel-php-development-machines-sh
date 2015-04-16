#!/usr/bin/env bash
# Author: Rômulo Mendes
# Description: Installs Ubunto 14.10 basics environment
# Usage: sudo bash ubunto-bootstrap.sh
# criado em 03/28/2015
#LAMP é a abreviação de L inux, A Pache, M ySQL, P HP. Este tutorial mostra como você pode instalar um servidor web Apache 2 em um servidor Ubuntu 14.10 com suporte PHP5 (mod_php) e suporte ao MySQL

	#1 logar como super user
sudo su
#Vamos instalar MariaDB em vez de MySQL, já que têm mais recursos avançados de MySQL. Vai ser instalado como se segue
#2 MariaDB
apt-get install -y mariadb-server mariadb-client
#Você será solicitado a fornecer uma senha para o usuário root do MySQL - 
#esta senha é válida para o usuário root @ localhost, bem como root@server1.example.com, por isso, 
#não tem que especificar uma senha de root MariaDB manualmente mais tarde :

#Nova senha para o usuário MariaDB "root": <- yourrootsqlpassword
#Repita a senha para o usuário MariaDB "root": <- yourrootsqlpassword

#3 Instalação Apache2
# Apache2 está disponível como um pacote Ubuntu, portanto, podemos instalá-lo como este:
apt-get install apache2

#4 Instalação PHP5
#Podemos instalar PHP5 eo módulo Apache PHP5 da seguinte forma:
apt-get install -y php5 libapache2-mod-php5
#Temos de reiniciar o Apache depois:
service apache2 restart

#Detalhes sobre a instalação PHP5 5 Testing PHP5 / Obtendo
subl /var/www/html/info.php
#dentro do arquivo cole o codigo abaixao
# <?php
# phpinfo();
# ?>
#Agora nós chamamos esse arquivo em um navegador (por exemplo http://$meuIp/info.php):

#6 ObterAssistência MySQL Em PHP5
apt-cache search php5
#Escolha o que você precisa e instalá-las assim:
apt-get -y install php5-mysql php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcache php5-ming php5-ps php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl

# Agora reinicie Apache2:
service apache2 restart
#Xcache é um PHP cacher opcode livre e aberto para cache e otimização do código intermediário PHP. É semelhante a outros cachers opcode PHP, como eAccelerator e APC. É altamente recomendável para ter um desses instalado para acelerar sua página PHP.
#Xcache pode ser instalado como se segue:
apt-get install php5-xcache
#Agora reinicie o Apache:
service apache2 restart
#Agora recarregue http://192.168.0.100/info.php no seu navegador e vá até a seção de módulos novamente. Agora você deve encontrar lotes de novos módulos de lá:

#7 phpMyAdmin
#phpMyAdmin é uma interface web através do qual você pode gerenciar seus bancos de dados MySQL. É uma boa idéia para instalá-lo:
apt-get install -y phpmyadmin
#Servidor Web para reconfigurar automaticamente: <- apache2
#Configurar banco de dados para phpmyadmin com dbconfig-common <? - Não
#Depois disso, você pode acessar phpMyAdmin sob http://$meuIp/phpmyadmin/:
sudo ln -s /usr/share/phpmyadmin/ /var/www/html/phpmyadmin
#e importante o apche e nem as pastas do site rodando com root
ls -la
sudo chmod -R 755 /var/www/html
sudo chown -R www-data:www-data /var/www/html
ls -la
