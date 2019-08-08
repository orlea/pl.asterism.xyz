#!/bin/sh
set -uxe

sudo docker-compose -f ~/pl.asterism.xyz/pleroma/pl-asterism-xyz.manage.yml pull
sudo docker-compose -f ~/pl.asterism.xyz/pleroma/pl-asterism-xyz.manage.yml run --rm web mix ecto.migrate
sudo docker stack deploy pleroma -c ~/pl.asterism.xyz/pleroma/pl-asterism-xyz.yml
sudo docker system prune --force
