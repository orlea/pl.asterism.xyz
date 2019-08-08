#!/bin/sh
set -uxe
destination=`path`

sudo -Hu postgres pg_dump -d pleroma_db --format=custom -f /tmp/pleroma.pgdump
rclone copy /tmp/pleroma.pgdump ${destination}/pg_dump
sudo rm /tmp/pleroma.pgdump
