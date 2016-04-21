#!/usr/bin/env bash
if [ ! -d "suma" ]; then
  # Control will enter here if $DIRECTORY does not exists.
 sudo git clone https://github.com/cazzerson/Suma.git suma
fi
sudo docker-compose up -d
