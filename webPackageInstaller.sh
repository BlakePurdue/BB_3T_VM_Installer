
#!/bin/bash

echo "--------Installing Packages for Baby Buddy WEB Server VM"

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install nginx

SERVERINFO="server {
     listen 80 default_server;
     location / {
         uwsgi_pass 0.0.0.0:8000;
         include uwsgi_params;
     }
     
     location /media {
         alias /var/www/babybuddy/data/media;
     }
 }"
 
 echo "${SERVERINFO}" > /etc/nginx/sites-available/babybuddy
 
 sudo ln -s /etc/nginx/sites-available/babybuddy /etc/nginx/sites-enabled/babybuddy
 
 sudo rm /etc/nginx/sites-enabled/default
 
 sudo service nginx restart
 
 netstat -plnt
