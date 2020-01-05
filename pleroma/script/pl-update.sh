#!/bin/sh
set -uxe

sudo docker-compose -f ~/pl.asterism.xyz/pleroma/pl-asterism-xyz.manage.yml pull
sudo docker-compose -f ~/pl.asterism.xyz/pleroma/pl-asterism-xyz.manage.yml run --rm web /opt/pleroma/bin/pleroma_ctl migrate
sudo docker stack deploy pleroma -c ~/pl.asterism.xyz/pleroma/pl-asterism-xyz.yml
sudo docker system prune --force
sudo docker node ls |grep Ready|awk '$2{print$2}'|grep -v "*"|xargs -L 1 -I {} ssh user@{} -i ~/key.pem "sudo docker system prune --force"
