#!/bin/bash

#Create Softlinks

ln -s /vagrant/suma/service/web/ /var/www/html/sumaserver
mkdir -p /var/www/html/suma/
ln -s /vagrant/suma/web/ /var/www/html/suma/client
ln -s /vagrant/suma/analysis/ /var/www/html/suma/analysis
mkdir /vagrant/suma/sumalogs/
touch /vagrant/suma/sumalogs/sumaserver.log
chmod 666 /vagrant/suma/sumalogs/sumaserver.log

cp /vagrant/configs/index.html /var/www/html

cp /vagrant/configs/apache2.conf /etc/apache2/

echo '\nServerName 0.0.0.0' >> /etc/apache2/apache2.conf
cat /etc/apache2/apache2.conf
mkdir -p /etc/php5/apache2/
cp /vagrant/configs/php.ini /etc/php5/apache2/

chmod 0644 /etc/php5/apache2/
echo '\nexport PHPRC=/etc/php5/apache2/php.ini' >> /etc/profile
a2dismod mpm_event
a2enmod mpm_prefork
a2enmod rewrite
/etc/init.d/apache2 restart

ln -sf /vagrant/configs/service/config/config.yaml /vagrant/suma/service/config/config.yaml
ln -sf /vagrant/configs/service/web/config/config.yaml /vagrant/suma/service/web/config/config.yaml
ln -sf /vagrant/configs/analysis/config/config.yaml /vagrant/suma/analysis/config/config.yaml
ln -sf /vagrant/configs/web/config/spaceassessConfig.js /vagrant/suma/web/config/spaceassessConfig.js

