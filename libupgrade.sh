systemctl stop cron php7.4-fpm nginx ; 
apt remove php7.4-* -y ;
apt autoremove -y ;
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg ;
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/sury-php.list ;
apt update ;
apt install acl curl fping git graphviz imagemagick mariadb-client mariadb-server mtr-tiny nginx-full nmap php-cli php-curl php-fpm php-gd php-gmp php-json php-mbstring php-mysql php-snmp php-xml php-zip python3-dotenv python3-pymysql python3-redis python3-setuptools python3-systemd python3-pip rrdtool snmp snmpd whois -y  ;
wget -O /etc/php/8.1/fpm/php.ini https://raw.githubusercontent.com/bhaukaalbaba/librenmsconfig/main/fpmphp.ini ;
wget -O /etc/php/8.1/cli/php.ini https://raw.githubusercontent.com/bhaukaalbaba/librenmsconfig/main/cliphp.ini ;
wget -O /etc/php/8.1/fpm/pool.d/librenms.conf https://raw.githubusercontent.com/bhaukaalbaba/librenmsconfig/main/phpfpmconf.conf ;
systemctl enable php8.1-fpm ; 
systemctl start php8.1-fpm ;
systemctl restart php8.1-fpm nginx cron ; 
echo "LibreNMS upgrade is complete"

