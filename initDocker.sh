#!/usr/bin/env bash
if [ ! -d "suma" ]; then
   git clone https://github.com/cazzerson/Suma.git suma
fi

if [ ! -d "suma/sumalogs" ]; then
        sudo mkdir suma/sumalogs
        sudo touch suma/sumalogs/sumaserver.log
        sudo chmod 666 suma/sumalogs/sumaserver.log
fi

sudo cp configs/service/web/config/config.yaml suma/service/web/config/config.yaml
sudo cp configs/analysis/config/config.yaml suma/analysis/config/config.yaml
sudo cp configs/web/config/spaceassessConfig.js suma/web/config/spaceassessConfig.js
