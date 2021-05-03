#!/bin/bash
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install

echo "
[Unit]
Description=Puma Service

[Service]
Type=simple
ExecStart=/usr/local/bin/puma --dir /home/andrey/reddit

[Install]
WantedBy=multi-user.target
" > /etc/systemd/system/puma.service

sudo systemctl start puma
sudo systemctl enable puma
