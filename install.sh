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

#Catphish
git clone https://github.com/ring0lab/catphish
	cd catphish
	bundle install

#Gophish
wget https://github.com/gophish/gophish/releases/download/v0.9.0/gophish-v0.9.0-linux-64bit.zip
unzip https://github.com/gophish/gophish/releases/download/v0.9.0/gophish-v0.9.0-linux-64bit.zip
rm https://github.com/gophish/gophish/releases/download/v0.9.0/gophish-v0.9.0-linux-64bit.zip
mv gophish-v0.9.0-linux-64bit gophish-v0.9


#PhishX - Phishing generator with multiple tools (*useful*)
git clone https://github.com/WeebSec/PhishX.git
	cd PhishX
	chmod +x installer.sh
	bash installer.sh
	python3 PhishX.py

#WeeMan
git clone evait-security/weeman.git

#SocialFish - Phishing server, can be used with mobile.
git clone https://github.com/UndeadSec/SocialFish.git
	cd SocialFish
	python3 -m pip install -r requirements.txt

#Artemis - Phishing page generator (clones a page, and allows your choice of selecter parameters.)
git clone https://github.com/sweetsoftware/Artemis.git
	cd Artemis
	python2 -m pip install -r requirements.txt


echo -e "${W}Please change SocialFish App Key in 'SocialFish/core/config.py'${NC}"

#PhishBait - Email harvester for attacks.
git clone https://github.com/pan0pt1c0n/PhishBait.git

#STP - Node based phishing server
git clone https://github.com/PowerScript/STP.git
