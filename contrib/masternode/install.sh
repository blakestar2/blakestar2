#!/bin/bash
if free | awk '/^Swap:/ {exit !$2}'; then
echo "Have swap"
else
sudo touch /var/swap.img
sudo chmod 600 /var/swap.img
sudo dd if=/dev/zero of=/var/swap.img bs=1024k count=2000
mkswap /var/swap.img
sudo swapon /var/swap.img
sudo echo "/var/swap.img none swap sw 0 0" >> /etc/fstab
fi
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get install mc htop git python-virtualenv ntpdate -y
sudo ntpdate -u pool.ntp.org
cd /opt
wget https://github.com/blakestar2/blakestar2/releases/download/2.0.1.2/blakestar-v2.0.1.2-linux.tgz
tar -xvf blakestar-v2.0.1.2.tgz
rm blakestar-v2.0.1.2.tgz
chmod +x -R ./blakestar-v2.0.1.2/*
git clone https://github.com/blakestar2/blakestar2-sentinel blakestar-sentinel
cd blakestar-sentinel
virtualenv ./venv
./venv/bin/pip install -r requirements.txt
cat <(crontab -l) <(echo "* * * * * cd /opt/blakestar-sentinel && ./venv/bin/python bin/sentinel.py >/dev/null 2>&1") | crontab -
/opt/blakestar-v2.0.1.2/blasd -daemon
sleep 10
masternodekey=$(/opt/blakestar-v2.0.1.2/blas-cli masternode genkey)
/opt/blakestar-v2.0.1.2/blas-cli stop
sleep 3
echo -e "\nserver=1\nlisten=1\ndaemon=1\nmaxconnections=256\nmasternode=1\nmasternodeprivkey=$masternodekey\nrpcuser=RPCUSER\nrpcpassword=RPCPASSWORD\nrpcport=9798\nrpcallowip=127.0.0.1\n" >> "/root/.blakestar/blakestar.conf"
sleep 3
sudo sed -i -e "s/exit 0/sudo \-u root \/opt\/blakestar-v2.0.1.2\/blasd \> \/dev\/null \&\nexit 0/g" /etc/rc.local
/opt/blakestar-v2.0.1.2/blasd -daemon
echo "Masternode private key: $masternodekey"
echo "Job completed successfully"
