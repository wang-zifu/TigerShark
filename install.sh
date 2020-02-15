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
echo -e "${LP}========================================================================${NC}"
chmod +x tigershark
WRKDIR=$(pwd)
if [[ ${WRKDIR} == '/opt/TigerShark' ]]; then
	echo ""
else
	cd ..
	sudo mv TigerShark -t /opt
	cd /opt/TigerShark
fi
# Toolinstallations
if [[ -d 'tools' ]]; then
	echo ""
else
	mkdir tools
fi
cd tools

#Catphish (done)
echo -e "${ORNG}"
figlet -f slant "CatPhish"
echo -e "${NC}"
if [[ -d 'catphish' ]]; then
	echo ""
else
	git clone https://github.com/ring0lab/catphish
	cd catphish
	bundle install
	echo -e "${W}CatPhish Installed${NC}"
	cd ..
fi

echo -e "${ORNG}"
figlet -f slant "GoPhish"
echo -e "${NC}"
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
echo -e "${ORNG}"
figlet -f slant "PhishX"
echo -e "${NC}"
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
echo -e "${ORNG}"
figlet -f slant "WeeMan"
echo -e "${NC}"
if [[ -d 'weeman' ]]; then
	echo ""
else
	git clone https://github.com/evait-security/weeman.git
fi

#SocialFish - Phishing server, can be used with mobile. (done)
echo -e "${ORNG}"
figlet -f slant "SocialFish"
echo -e "${NC}"
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
echo -e "${ORNG}"
figlet -f slant "Artemis"
echo -e "${NC}"
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
echo -e "${ORNG}"
figlet -f slant "PhishBait"
echo -e "${NC}"
if [[ -d 'PhishBait' ]]; then
	echo ""
else
	git clone https://github.com/pan0pt1c0n/PhishBait.git
	echo -e "${W}PhishBait Installed${NC}"
fi

#STP - Node based phishing server (done)
echo -e "${ORNG}"
figlet -f slant "STP"
echo -e "${NC}"
if [[ -d 'STP' ]]; then
	echo ""
else
	git clone https://github.com/PowerScript/STP.git
	echo -e "${W}STP Installed${NC}"
fi

#King-Phisher
echo -e "${ORNG}"
figlet -f slant "King-Phisher"
echo -e "${NC}"
if [[ -d 'king-phisher' ]]; then
	echo ""
else
	git clone https://github.com/securestate/king-phisher.git
	cd king-phisher
	wget -q https://github.com/securestate/king-phisher/raw/master/tools/install.sh && \
	sudo bash ./install.sh
	echo -e "${W}King-Phisher Installed${NC}"
fi

#HiddenEye (done)
echo -e "${ORNG}"
figlet -f slant "HiddenEye"
echo -e "${NC}"
if [[ -d 'HiddenEye' ]]; then
	echo ""
else
	git clone https://github.com/DarkSecDevelopers/HiddenEye.git
	chmod 777 HiddenEye
	sudo apt-get install python3-pip
	cd HiddenEye
	sudo pip3 install -r requirements.txt
	sudo pip3 install requests
	echo -e "${W}HiddenEye Installed${NC}"
	cd ..
fi

# PhEmail
echo -e "${ORNG}"
figlet -f slant "PhEmail"
echo -e "${NC}"
if [[ -d 'PhEmail' ]]; then
	echo ""
else
	git clone https://github.com/Dionach/PhEmail
fi

# DomainHunter
echo -e "${ORNG}"
figlet -f slant "DomainHunter"
echo -e "${NC}"
if [[ -d 'domainhunter' ]]; then
	echo ""
else
	git clone https://github.com/threatexpress/domainhunter
	cd domainhunter
	sudo python3 -m pip install -r requirements.txt
	sudo apt-get install python3-pil
	cd ..
fi

# CredSniper
echo -e "${ORNG}"
figlet -f slant "CredSniper"
echo -e "${NC}"
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


echo -e "${W}Please change SocialFish App Key in 'SocialFish/core/config.py'${NC}"
echo -e "${W}GoPhish default login is admin:gophish${NC}"
