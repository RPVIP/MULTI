#!/bin/bash
#Scripter PenguinEHIS
menu(){
clear
echo -e "\n\033[0;34m═════════════════════════════════════════════════\033[0m"
        echo ""
        echo -e "                 \033[1;33m• \033[1;31mATENCAO \033[1;33m• \033[0m"
        echo ""
        echo -e "\033[1;31m• \033[1;33mINSTALADOR DO PAINEL WEB MEGASSH 2022\033[0m•"
        echo""
        echo -e "\n\033[0;34m═════════════════════════════════════════════════\033[0m"
        echo ""
echo "Continuar? Y\n"
echo -n "> "
read option
if [ $option = "Y" ]; then
install
elif [ $option = "y" ]; then
install
elif [ $option = "n" ]; then
exit
elif [ $option = "N" ]; then
exit
else
menu
fi
}
install(){
clear
yum update -y
yum upgrade -y
yum install epel-release -y 
yum install php htop zip nload nano phpmyadmin httpd mysql mariadb-server php-pecl-ssh2 -y --skip-broken
yum install gcc php-devel libssh2 libssh2-devel php-pear make php-mcrypt unzip wget screen -y --skip-broken
setsebool -P httpd_can_network_connect 1
systemctl enable httpd 
systemctl enable mariadb
service httpd restart
service mariadb start
dbconfig
}
dbconfig(){
clear
echo "Insira a senha do ROOT Banco de dados"
echo -n "> "
read root_password
if [ -z $root_password ]; then
clear 
echo "Please put a password"
sleep 2
dbconfig
else
#Comandos Usados do site: https://geekdudes.wordpress.com/2020/07/16/linux-bash-script-for-creating-and-configuring-maria-database/
mysql -e "UPDATE mysql.user SET Password = PASSWORD('$root_password') WHERE User = 'root'"
mysql -e "FLUSH PRIVILEGES"
phpmyadminfix
fi
}
phpmyadminfix(){
rm /etc/httpd/conf.d/phpMyAdmin.conf
wget https://raw.githubusercontent.com/RPVIP/MULTI/main/phpMyAdmin.conf -O /etc/httpd/conf.d/phpMyAdmin.conf
chmod 777 /etc/httpd/conf.d/phpMyAdmin.conf
service httpd restart
installweb
}
installweb(){
cd /var/www/html
wget https://www.dropbox.com/s/thaggb6o2gxqyk2/2022.zip
unzip 2022.zip
sed -i "s;1010;$root_password;g" /var/www/html/pages/system/pass.php > /dev/null 2>&1
chmod 777 -R /var/www/
cd
createdb
}
createdb(){
wget https://raw.githubusercontent.com/RPVIP/MULTI/main/sshplus.sql
mysql -h localhost -u root -p$root_password -e "CREATE DATABASE sshplus"
mysql -h localhost -u root -p$root_password --default_character_set utf8 sshplus < sshplus.sql
rm banco.sql
croninstall
}
croninstall(){
#Salvo pelo gongo: https://stackoverflow.com/questions/878600/how-to-create-a-cron-job-using-bash-automatically-without-the-interactive-editor
crontab -l > mycron
echo "@reboot /root/startup" >> mycron
crontab mycron
rm mycron
wget https://raw.githubusercontent.com/RPVIP/MULTI/main/cronc.sh
wget https://raw.githubusercontent.com/RPVIP/MULTI/main/cronb.sh
wget https://raw.githubusercontent.com/RPVIP/MULTI/main/clean.sh
wget https://raw.githubusercontent.com/RPVIP/MULTI/main/startup.sh
chmod +x *.sh
./startup.sh
final
}
final(){
clear
echo "Login: admin"
echo "Senha: admin"
echo "Acesso admin: IPVPS/admin"
echo "Acesso PHPMYADMIN: IPVPS/phpmyadmin"
echo "Login PHPMYADMIN: root senha: $root_password"
sleep 10
}
menu
