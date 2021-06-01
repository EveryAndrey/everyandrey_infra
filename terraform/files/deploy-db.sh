#!/bin/bash
IP_ADDRESS=$1
sudo sed -i "s/bindIp: 127.0.0.1/bindIp: ${IP_ADDRESS},127.0.0.1/" /etc/mongod.conf
sudo systemctl daemon-reload
sudo systemctl restart mongod.service
