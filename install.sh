#!/bin/sh

sudo systemctl stop home-assistant.service
echo "Stopping Home Assistant"

echo "Copying YAML files"
sudo cp *.yaml /srv/home-assistant

echo "Fixing permissions"
sudo chown -R hass:hass /srv/home-assistant

echo "Copying systemd service file"
sudo cp systemd/home-assistant.service /usr/lib/systemd/system/

echo "Reloading systemctl daemons"
sudo systemctl daemon-reload

echo "Starting Home Assistant"
sudo systemctl start home-assistant.service
