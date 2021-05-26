#!/bin/bash

echo "--------Installing Packages for Baby Buddy DB Server VM"

sudo apt-get update
sudo apt-get upgrade

echo "--------VM Updated and Upgraded"

sudo apt install -y postgresql libpq-dev

echo "---------Installed Postgresql libpq-dev"

sudo systemctl status postgresql

netstat -plnt

echo ""
echo "--------DB Steps 1-5 complete"
