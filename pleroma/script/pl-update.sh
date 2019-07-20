#!/bin/sh
set -uxe
emoji-bucket=`path`

sudo -Hu pleroma git -C /opt/pleroma pull
cd /opt/pleroma
sudo -Hu pleroma MIX_ENV=prod mix deps.get
sudo -Hu pleroma MIX_ENV=prod mix compile
sudo systemctl stop pleroma
sudo -Hu pleroma MIX_ENV=prod mix ecto.migrate
sudo -Hu pleroma rclone sync wasabi:${emoji-bucket} /opt/pleroma/priv/static/emoji/custom
sudo systemctl start pleroma
