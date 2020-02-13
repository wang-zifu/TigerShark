#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'

echo -e "${ORNG}"
figlet -f mini "Installing Dependancies"
echo -e "${NC}"
sudo apt-get install golang-1.11 golang-1.11-go golang-1.11-src git python2 python3 python3-pip python3-dev python3 virtualenv gnupg certbot
# Catphish
cd tools/catphish
	bundle install
# GoPhish
cd ../gophish
	go get github.com/gophish/gophish
	go build
	sudo cp gophish -t /usr/sbin
	sudo chown $USER:$USER /usr/sbin/gophish
# PhishX
cd ../PhishX
	chmod +x installer.sh
	bash installer.sh
	python3 PhishX.py
# SocialFish
cd ../SocialFish
	python3 -m pip install -r requirements.txt
# Artemis
cd ../Artemis
	python2 -m pip install -r requirements.txt
# King-Phisher
cd ..
	wget -q https://github.com/securestate/king-phisher/raw/master/tools/install.sh && \
	sudo bash ./install.sh
# HiddenEye
cd HiddenEye
	chmod 777 HiddenEye
	sudo apt-get install python3-pip
	cd HiddenEye
	sudo pip3 install -r requirements.txt
	sudo pip3 install requests
# DomainHunter
cd ../domainhunter
	sudo python3 -m pip install -r requirements.txt
# CredSniper
cd ../CredSniper
	sudo python3 -m pip install -r requirements.txt
	chmod +x install.sh
	./install.sh

echo -e "${W}Please change SocialFish App Key in 'SocialFish/core/config.py'${NC}"
echo -e "${W}GoPhish default login is admin:gophish${NC}"