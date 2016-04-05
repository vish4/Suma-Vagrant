#!/usr/bin/env bash
if [ ! -d "suma" ]; then
  # Control will enter here if $DIRECTORY exists.
 sudo git clone https://github.com/cazzerson/Suma.git suma
fi
sudo docker-compose up -d
