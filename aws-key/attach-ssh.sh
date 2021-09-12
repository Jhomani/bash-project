#!/bin/bash

read -p 'Username: ' username;

privateKey='';
sshLocal='./rsa.pub';
target='devops'; # default target

cat > ./tmp.sh <<- EOM
#!/bin/bash

if [ ! -e /home/devops ]
then
	sudo useradd -g users -m devops -s /bin/bash; 
	sudo su devops -c 'mkdir -p /home/devops/.ssh';
	sudo su devops -c 'cat ./tmp > /home/devops/.ssh/authorized_keys';
else
	cat ./tmp >> ./.ssh/authorized_keys;
fi

rm tmp tmp.sh;
EOM
eval 'chmod 766 ./tmp.sh';

if [ $username == 'admin' ] || [ $username == 'devops' ]
then
	[[ $username == 'admin' ]] && echo '' > ./tmp.ssh;
	target='admin';
	sshLocal='~/.ssh/id_rsa.pub';
	privateKey="-i 'machine-pair.pem'";
fi;

cat > ./tmp <<- EOM

#$username key 
$(eval cat $sshLocal)
EOM

eval "scp $privateKey ./tmp ./tmp.sh $target@54.219.21.26:/home/$target";
eval "ssh $privateKey $target@54.219.21.26 './tmp.sh'";

eval 'rm ./tmp ./tmp.sh';
