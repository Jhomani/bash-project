#!/bin/bash
sudo useradd -G users -m devops;

#create porjects files
read -a 'Enter projects'  projects;

for i in ${projects[@]}
do
	sudo mkdir -p $i/{backend/{development,production,},frontend/{development,production,},}
	echo created $i file
done;

# webserver
sudo apt install nginx certbot python3-certbot-nginx -y;
sudo systemctl start nginx ;

read -p 'Enter domain and port(google.com 3011)' domain port;

sudo touch /etc/nginx/sites-available/$domain;

cat << EOM
server {
	server_name $domain;

	location / {
		proxy_http_version 1.1;
		proxy_set_header Upgrade $http_upgrade;
		proxy_set_header Connection "upgrade";
		proxy_set_header   X-Forwarded-For $remote_addr;
		proxy_set_header   Host $http_host;
		proxy_pass http://127.0.0.1:$port;
	}
}
EOM
cat > /etc/nginx/sites-available/$domain;
sudo ln -s /etc/nginx/sites-available/$domain /etc/nginx/sites-enabled/;

sudo nginx -t > /dev/null 2>&1 # to run without log

if[ $? == 0]
then
	echo Good setted nginx;
	sudo systemctl restart nginx;
else
	echo Warning....  we have problems while setting ngix please check that;
fi
	


echo To confing SSL run this command \`sudo certbot --nginx\`;
