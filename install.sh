#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'

sudo apt-get install golang-1.11 golang-1.11-go golang-1.11-src git python2 python3 python3-pip python3-dev python3 virtualenv gnupg certbot
echo -e "${YLW}This script will download and install all the tools needed for TigerShark to run."
echo -e "If this is okay, hit enter - otherwise Ctrl + c to cancel${NC}"
read ACCEPT
echo -e "${LP}================================================================================${NC}"
chmod +x tigershark
# Toolinstallations
if [[ -d 'tools' ]]; then
	echo ""
else
	mkdir tools
fi
cd tools

#Catphish (done)
if [[ -d 'catphish' ]]; then
	echo ""
else
	git clone https://github.com/ring0lab/catphish
	cd catphish
	bundle install
	echo -e "${W}CatPhish Installed${NC}"
	cd ..
fi

#Gophish (done)
if [[ -d 'gophish' ]]; then
	echo ""
else
	git clone https://github.com/gophish/gophish.git
	cd gophish
	go get github.com/gophish/gophish
	go build
	sudo cp gophish -t /usr/sbin
	sudo chown $USER:$USER /usr/sbin/gophish
	echo -e "${W}GoPhish Installed${NC}"
	cd ..
fi

#PhishX - Phishing generator with multiple tools (*useful*) (done)
if [[ -d 'PhishX' ]]; then
	echo ""
else
	git clone https://github.com/rezaaksa/PhishX.git
	cd PhishX
	chmod +x installer.sh
	bash installer.sh
	python3 PhishX.py
	echo -e "${W}PhishX Installed${NC}"
	cd ..
fi

#WeeMan
if [[ -d 'weeman' ]]; then
	echo ""
else
	git clone https://github.com/evait-security/weeman.git
fi

#SocialFish - Phishing server, can be used with mobile. (done)
if [[ -d 'SocialFish' ]]; then
	echo ""
else
	git clone https://github.com/UndeadSec/SocialFish.git
	cd SocialFish
	python3 -m pip install -r requirements.txt
	echo -e "${W}SocialPhish Installed${NC}"
	cd ..
fi

#Artemis - Phishing page generator (clones a page, and allows your choice of selecter parameters.) (done)
if [[ -d 'Artemis' ]]; then
	echo ""
else
	git clone https://github.com/sweetsoftware/Artemis.git
	cd Artemis
	python2 -m pip install -r requirements.txt
	echo -e "${W}Artemis Installed${NC}"
	cd ..
fi

#PhishBait - Email harvester for attacks. (done)
if [[ -d 'PhishBait' ]]; then
	echo ""
else
	git clone https://github.com/pan0pt1c0n/PhishBait.git
	echo -e "${W}PhishBait Installed${NC}"
fi

#STP - Node based phishing server (done)
if [[ -d 'STP' ]]; then
	echo ""
else
	git clone https://github.com/PowerScript/STP.git
	echo -e "${W}STP Installed${NC}"
fi

#King-Phisher
#if [[ -d '/opt/king-phisher' ]]; then
#	echo ""
#else
#	wget -q https://github.com/securestate/king-phisher/raw/master/tools/install.sh && \
#	sudo bash ./install.sh
#	echo -e "${W}King-Phisher Installed${NC}"
#fi

#HiddenEye (done)
if [[ -d 'HiddenEye' ]]; then
	echo ""
else
	git clone https://github.com/DarkSecDevelopers/HiddenEye.git
	cd HiddenEye
	chmod 777 HiddenEye
	sudo apt-get install python3-pip
	cd HiddenEye
	sudo pip3 install -r requirements.txt
	sudo pip3 install requests
	echo -e "${W}HiddenEye Installed${NC}"
	cd ..
fi

# PhEmail
if [[ -d 'PhEmail' ]]; then
	echo ""
else
	git clone https://github.com/Dionach/PhEmail
fi

# DomainHunter
if [[ -d 'DomainHunter' ]]; then
	echo ""
else
	git clone https://github.com/threatexpress/domainhunter
	cd domainhunter
	sudo python3 -m pip install -r requirements.txt
	sudo apt-get install python3-pil
	cd ..
fi

# CredSniper
if [[ -d 'CredSniper' ]]; then
	echo ""
else
	git clone https://github.com/s1l3n7h0s7/CredSniper
	cd CredSniper
	sudo python3 -m pip install -r requirements.txt
	chmod +x install.sh
	./install.sh
	cd ..
fi

echo -e "${RED}Is this the first time install tigershark or are you updating?(i/u)${NC}"
read UPQ
if [[ $UPQ == "i" ]]; then
	echo -e "${W}Would you like tigershark to run from anywhere?(y/n)${NC}"
	read ANY
	if [[ ${ANY} == "y" ]]; then
		sudo cp tigershark -t /usr/sbin
	else
		echo ""
	fi
	echo -e "${W}Please change SocialFish App Key in 'SocialFish/core/config.py'${NC}"
	echo -e "${W}GoPhish default login is admin:gophish${NC}"
else
	if [[ -f /usr/sbin/tigershark ]]; then
		sudo cp tigershark -t /usr/sbin
		sudo chown $USER:$USER /usr/sbin/tigershark
	else
		echo ""
	fi
fi


