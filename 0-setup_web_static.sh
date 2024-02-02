#!/usr/bin/env bash
# Bash script that sets up your web servers for the deployment of web_static. It must:
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get install -y nginx
sudo ufw allow 'Nginx HTTP'
sudo mkdir -p /data/web_static/releases/test /data/web_static/shared
echo "Test My Server" | sudo tee /data/web_static/releases/test/index.html

# Create a new symbolic link
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current
sudo chown -hR ubuntu:ubuntu /data/
sudo sed -i '/listen 80 default_server/a \\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t}\n' /etc/nginx/sites-available/default
sudo service nginx restart
