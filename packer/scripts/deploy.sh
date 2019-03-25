#! /bin/bash

echo "Deploy app..."
cd /
sudo git clone -b monolith https://github.com/express42/reddit.git
sudo chown appuser.appuser -R /reddit
cd reddit && bundle install

sudo mv /tmp/puma.service /etc/systemd/system/puma.service
sudo systemctl start puma
sudo systemctl enable puma