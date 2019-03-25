#! /bin/bash

echo "Setup service..."
sudo mv /reddit/monolith.service /etc/systemd/system/monolith.service
sudo systemctl start monolith
sudo systemctl enable monolith
