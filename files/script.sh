#!bin/bash
#sudo apt update
#sudo apt upgrade -y
#sudo apt install -y nginx
sudo echo -e "Hello! This content is being served by Nginx Server with the following IP Address: `sudo hostname -I | awk '{print $1}'`" > /var/www/html/index.html
sudo systemctl start nginx

