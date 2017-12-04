#!/bin/bash

if [ "$1" == "update" ]; then
    cd /app/wifidog-gateway
    git pull
    git checkout v${WIFIDOG_VERSION} -b v${WIFIDOG_VERSION}
    ./autogen.sh
    ./configure --host=mipsel-linux-gnu --prefix=/opt/wifidog-gateway --enable-shared=no \
    --enable-html-docs=no 
    make && make install && make clean
elif [ "$1" == "bash" ]; then
    /bin/bash
fi

cp -Rf /opt/wifidog-gateway  /wifidog
