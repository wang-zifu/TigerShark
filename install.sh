#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'

sudo apt-get install go git python2 python3 python3-pip python3-dev
echo -e "${YLW}This script will download and install all the tools needed for TigerShark to run."
echo -e "If this is okay, hit enter - otherwise Ctrl + c to cancel${NC}"
read ACCEPT
mkdir tools
cd tools

#Catphish (done)
git clone https://github.com/ring0lab/catphish
	cd catphish
	bundle install
	echo -e "${W}CatPhish Installed${NC}"

#Gophish
git clone https://github.com/gophish/gophish.git
	cd gophish
	go get github.com/gophish/gophish
	go build
	sudo cp gophish -t /usr/sbin
	sudo chmod $USER:$USER /usr/sbin/gophish
echo -e "${W}GoPhish Installed${NC}"

#PhishX - Phishing generator with multiple tools (*useful*) (done)
git clone https://github.com/WeebSec/PhishX.git
	cd PhishX
	chmod +x installer.sh
	bash installer.sh
	python3 PhishX.py
	echo -e "${W}PhishX Installed${NC}"

#WeeMan
git clone evait-security/weeman.git

#SocialFish - Phishing server, can be used with mobile. (done)
git clone https://github.com/UndeadSec/SocialFish.git
	cd SocialFish
	python3 -m pip install -r requirements.txt
	echo -e "${W}SocialPhish Installed${NC}"

#Artemis - Phishing page generator (clones a page, and allows your choice of selecter parameters.) (done)
git clone https://github.com/sweetsoftware/Artemis.git
	cd Artemis
	python2 -m pip install -r requirements.txt
	echo -e "${W}Artemis Installed${NC}"

#PhishBait - Email harvester for attacks. (done)
git clone https://github.com/pan0pt1c0n/PhishBait.git
	echo -e "${W}PhishBait Installed${NC}"

#STP - Node based phishing server (done)
git clone https://github.com/PowerScript/STP.git
	echo -e "${W}STP Installed${NC}"

#King-Phisher
wget -q https://github.com/securestate/king-phisher/raw/master/tools/install.sh && \
	sudo bash ./install.sh
	echo -e "${W}King-Phisher Installed${NC}"

#HiddenEye (done)
git clone https://github.com/DarkSecDevelopers/HiddenEye.git
	chmod 777 HiddenEye
	sudo apt-get install python3-pip
	cd HiddenEye
	sudo pip3 install -r requirements.txt
	sudo pip3 install requests
	echo -e "${W}HiddenEye Installed${NC}"



echo -e "${W}Please change SocialFish App Key in 'SocialFish/core/config.py'${NC}"
echo -e "${W}GoPhish default login is admin:gophish${NC}"
