#!/bin/sh
set -uxe
destination=`path`

sudo -Hu postgres pg_dump -d pleroma_db --format=custom -f /backup/pleroma.pgdump
cp /backup/pleroma.pgdump ~/backup/pleroma.pgdump
sudo rm -rf /backup/pleroma.pgdump
cp /etc/nginx/conf.d/pleroma.conf ~/backup/pleroma.conf
cp /opt/pleroma/config/prod.secret.exs ~/backup/prod.secret.exs
cp /opt/pleroma/config/keys.secret.exs ~/backup/keys.secret.exs

rclone copy ~/backup/pleroma.pgdump ${destination}/pg_dump
rclone copy ~/backup/pleroma.conf ${destination}/nginx
rclone copy ~/backup/prod.secret.exs ${destination}/pleroma-config
rclone copy ~/backup/keys.secret.exs ${destination}/pleroma-config

rm -rf ~/backup/*
