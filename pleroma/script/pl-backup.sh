#!/bin/sh
set -uxe
pgdump_destination=`path`
config_destination=`path`
nowtime=`date +%Y-%m-%d-%H%M`

sudo -Hu postgres pg_dump -d pleroma_db --format=custom -f /backup/pleroma.pgdump
cp /backup/pleroma.pgdump ~/backup/pleroma-${nowtime}.pgdump --force
cp /opt/pleroma/config/prod.secret.exs ~/backup/prod.secret-${nowtime}.exs

rclone copy  ~/backup/pleroma-${nowtime}.pgdump ${pgdump_destination}
rclone copy  ~/backup/prod.secret-${nowtime}.exs ${config_destination}

oldfile=`rclone lsf ${pgdump_destination}|sed -n 1p|awk '{print $1}'`
rclone delete ${pgdump_destination}/${oldfile}

oldfile=`rclone lsf ${config_destination}|sed -n 1p|awk '{print $1}'`
rclone delete ${config_destination}/${oldfile}

rm -f ~/backup/pleroma-${nowtime}.pgdump
rm -f ~/backup/prod.secret-${nowtime}.exs

