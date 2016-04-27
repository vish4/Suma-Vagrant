#!/usr/bin/env bash

#cd /tmp
#echo "Override docker upstart init config"
#echo "start on (vagrant-mounted and filesystem and net-device-up IFACE!=lo)" > /etc/init/docker.override

#echo "Installing docker-compose..."
#wget https://bootstrap.pypa.io/get-pip.py
#python get-pip.py

#/usr/local/bin/pip install -U docker-compose twarc

#cd /vagrant

if [ ! -d "suma" ]; then
  sudo git clone https://github.com/cazzerson/Suma.git suma
fi

if [ ! -d "suma/sumalogs" ]; then
	mkdir suma/sumalogs
	touch suma/sumalogs/sumaserver.log
	chmod 666 suma/sumalogs/sumaserver.log
fi

cp configs/service/web/config/config.yaml suma/service/web/config/config.yaml
cp configs/analysis/config/config.yaml suma/analysis/config/config.yaml
cp configs/web/config/spaceassessConfig.js suma/web/config/spaceassessConfig.js

#echo "Pulling containers"
sudo docker-compose pull

#echo "Running containers"
docker-compose up -d --timeout 300

cp configs/service/config/config.yaml suma/service/config/config.yaml
sleep 10s
