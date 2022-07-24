#!/bin/bash
### BEGIN INIT INFO
# Provides:          smartsys
# Required-Start:    $all
# Required-Stop:     $local_fs $remote_fs
# Should-Start:      $syslog
# Should-Stop:       $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start or stop.
### END INIT INFO

sudo adduser $USER sudo
sudo adduser $USER dialout

cp 99-usb.rules /etc/udev/rules.d/
udevadm trigger

export CR_PAT=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
echo $CR_PAT | docker login ghcr.io -u $USER --password-stdin

docker volume create --name=ecolab_postgres-data
docker volume create --name=grafana-data

docker pull ghcr.io/smrtsstms/ecolab_master:latest
docker pull ghcr.io/smrtsstms/ecolab_device_connector:latest
docker pull ghcr.io/smrtsstms/ecolab_db_connector:latest
docker pull ghcr.io/smrtsstms/ecolab_grafana:latest

docker-compose up -d

xdg-open http://192.168.1.130:9000/d/dLmLK0gVk/panel-pokazanii-s-pribora-ekolab?orgId=1
