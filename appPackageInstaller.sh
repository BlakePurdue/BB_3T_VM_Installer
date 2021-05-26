#!/bin/bash

echo "--------Installing Packages for Baby Buddy APP Server VM"

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install python3 python3-pip uwsgi uwsgi-plugin-python3 git libopenjp2-7-dev libpq-dev

alias python=python3

sudo -H pip3 install pipenv

sudo mkdir /var/www

sudo mkdir /var/www/babybuddy

sudo chown $USER:$USER /var/www/babybuddy

mkdir -p /var/www/babybuddy/data/media

git clone https://github.com/babybuddy/babybuddy.git /var/www/babybuddy/public

cd /var/www/babybuddy/public

export PIPENV_VENV_IN_PROJECT=1

pipenv install --three

pipenv shell

cp babybuddy/settings/production.example.py babybuddy/settings/production.py

echo "--------Completed install for APP server VM -Now At Step 16"
