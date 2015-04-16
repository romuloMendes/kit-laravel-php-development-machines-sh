sudo apt-get update
# Java 8 JDK & JRE
sudo add-apt-repository ppa:webupd8team/java
#Para adicionar o repositório do Oracle Java WebUpd8 PPA e instalar o Oracle Java 8 em Debian, use os seguintes comandos:
sudo echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
sudo echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
sudo apt-get install oracle-java8-installer
#Você pode conferir a versão do Java em seu sistema usando os seguintes comandos:
java -version

sudo update-java-alternatives -l
sudo update-java-alternatives -s java-8-oracle
#Oracle Java 8 instalador requer que você aceitar a licença do Oracle antes de iniciar a instalação. Se por algum motivo você quer aceitar a licença automaticamente, você pode usar o seguinte comando
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
#Há um pacote em nosso repositório que define automaticamente as variáveis de ambiente Java 8 e define JDK8 como o JDK padrão. Para instalá-lo, use o seguinte comando:
sudo apt-get install oracle-java8-set-default

#-- Pesquisa Fonte
#http://www.webupd8.org/2014/03/how-to-install-oracle-java-8-in-debian.html
#http://tecadmin.net/install-oracle-java-8-jdk-8-ubuntu-via-ppa/
#http://tecadmin.net/install-java-8-on-centos-rhel-and-fedora/
