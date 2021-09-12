#!/bin/bash
#create files

#declare -a arr=("element1" "element2" "element3")
#
#read -a arr
#
#for i in "${arr[@]}"
#do
#   echo "$i"
#done
#
#read -p 'Projects '  projectName
#
#echo It\'s nice to meet you $projectName

msg="
ls;
ls -al;
";

eval $msg;
echo $msg > test.txt;


#cat << EOM
#server {
#	server_name back-impuestos.blockchainconsultora.com;
#
#	location / {
#		proxy_http_version 1.1;
#		proxy_set_header Upgrade $http_upgrade;
#		proxy_set_header Connection "upgrade";
#		proxy_set_header   X-Forwarded-For $remote_addr;
#		proxy_set_header   Host $http_host;
#		proxy_pass http://127.0.0.1:3011;
#	}
#}
#EOM
#
#echo $cat
