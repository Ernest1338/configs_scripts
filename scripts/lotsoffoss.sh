#!/bin/bash

cd ~
sudo apt update
sudo apt install -y docker.io wget git nginx curl nano docker-compose unzip
rm /var/www/html/index.nginx-debian.html
export IP=$(curl ifconfig.me 2>/dev/null)
echo "<h1><a href="element">Element</a></h1><h1><a href="http://$IP:3000">Gitea</a></h1><h1><a href="http://$IP:8080">Nextcloud</a></h1><h1><a href="http://$IP:8000">Jitsi Meet</a></h1><h1><a href="http://$IP:8888">Searx</a></h1>" > /var/www/html/index.html
docker run -d -p 8080:80 --name nextcloud nextcloud:latest
docker run -d -p 8888:8080 --name searx searx/searx
docker run -it --rm \
    --mount type=volume,src=synapse-data,dst=/data \
    -e SYNAPSE_SERVER_NAME=$IP \
    -e SYNAPSE_REPORT_STATS=yes \
    matrixdotorg/synapse:latest generate
docker run -d --name synapse \
    --mount type=volume,src=synapse-data,dst=/data \
    -p 8008:8008 \
    matrixdotorg/synapse:latest
docker exec synapse bash -c 'echo "" >> /data/homeserver.yaml; echo "enable_registration: true" >> /data/homeserver.yaml'
docker restart synapse
wget https://github.com/vector-im/element-web/releases/download/v1.7.34/element-v1.7.34.tar.gz -O ~/element.tar.gz
tar -xzvf element.tar.gz
mkdir /var/www/html/element/
mv element*/* /var/www/html/element/
mv /var/www/html/element/config.sample.json /var/www/html/element/config.json
echo -e "http://$IP:8008 # Change the base_url to this url and remove this line (you can also change the server_name)\n$(cat /var/www/html/element/config.json)" > /var/www/html/element/config.json
nano /var/www/html/element/config.json
wget https://github.com/go-gitea/gitea/releases/download/v1.14.6/gitea-1.14.6-linux-amd64 -O ~/gitea
chmod +x ~/gitea
~/gitea &
wget https://github.com/jitsi/docker-jitsi-meet/archive/refs/tags/stable-5963.zip -O ~/jitsi.zip
unzip ~/jitsi.zip
cd docker-jitsi*
cp env.example .env
./gen-passwords.sh
mkdir -p ~/.jitsi-meet-cfg/{web/letsencrypt,transcripts,prosody/config,prosody/prosody-plugins-custom,jicofo,jvb,jigasi,jibri}
docker-compose up -d
cd ~
