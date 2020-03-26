#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'

sudo apt-get install golang-1.11 golang-1.11-go golang-1.11-src git python2 python3 python3-pip python3-dev python3 virtualenv gnupg certbot wine wine64
echo -e "${YLW}This script will download and install all the tools needed for TigerShark to run."
echo -e "If this is okay, hit enter - otherwise Ctrl + c to cancel${NC}"
read ACCEPT
echo -e "${LP}================================================================================${NC}"
chmod +x tigershark
# Toolinstallations
if [[ -d 'tools' ]]; then
	sleep 1
else
	mkdir tools
fi
cd tools

#Catphish (done)
if [[ -d 'catphish' ]]; then
	sleep 1
else
	git clone https://github.com/ring0lab/catphish
	cd catphish
	bundle install
	echo -e "${W}CatPhish Installed${NC}"
	cd ..
fi

#Gophish (done)
if [[ -d 'gophish' ]]; then
	sleep 1
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
	sleep 1
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
	sleep 1
else
	git clone https://github.com/evait-security/weeman.git
fi

#SocialFish - Phishing server, can be used with mobile. (done)
if [[ -d 'SocialFish' ]]; then
	sleep 1
else
	git clone https://github.com/UndeadSec/SocialFish.git
	cd SocialFish
	python3 -m pip install -r requirements.txt
	echo -e "${W}SocialPhish Installed${NC}"
	cd ..
fi

#Artemis - Phishing page generator (clones a page, and allows your choice of selecter parameters.) (done)
if [[ -d 'Artemis' ]]; then
	sleep 1
else
	git clone https://github.com/sweetsoftware/Artemis.git
	cd Artemis
	python2 -m pip install -r requirements.txt
	echo -e "${W}Artemis Installed${NC}"
	cd ..
fi

#PhishBait - Email harvester for attacks. (done)
if [[ -d 'PhishBait' ]]; then
	sleep 1
else
	git clone https://github.com/pan0pt1c0n/PhishBait.git
	echo -e "${W}PhishBait Installed${NC}"
fi

#STP - Node based phishing server (done)
if [[ -d 'STP' ]]; then
	sleep 1
else
	git clone https://github.com/PowerScript/STP.git
	echo -e "${W}STP Installed${NC}"
fi

#HiddenEye (done)
if [[ -d 'HiddenEye' ]]; then
	sleep 1
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
	sleep 1
else
	git clone https://github.com/Dionach/PhEmail
fi

# DomainHunter
if [[ -d 'domainhunter' ]]; then
	sleep 1
else
	git clone https://github.com/threatexpress/domainhunter
	cd domainhunter
	sudo python3 -m pip install -r requirements.txt
	sudo apt-get install python3-pil
	cd ..
fi

# CredSniper
if [[ -d 'CredSniper' ]]; then
	sleep 1
else
	git clone https://github.com/s1l3nt78/CredSniper
	cd CredSniper
	sudo python3 -m pip install -r requirements.txt
	chmod +x install.sh
	./install.sh
	cd ..
fi

# Enigma
if [[ -d 'Enigma' ]]; then
	sleep 1
else 
	git clone https://github.com/UndeadSec/Enigma.git
fi

# Pupy
if [[ -d 'pupy' ]]; then
	sleep 1
else
	git clone --recursive https://github.com/n1nj4sec/pupy.git
	cd pupy
	python create-workspace.py -DG pupyw
	sleep 5
	mv /opt/TigerShark/.vs/pupy.conf.default -t /opt/TigerShark/tools/pupy/pupy
fi

# ie11 VB Exploit
if [[ -d 'ie11_vbscript_exploit' ]]; then
	sleep 1
else
	git clone https://github.com/ruthlezs/ie11_vbscript_exploit.git
fi

# EmailGen
if [[ -d 'EmailGen' ]]; then
	sleep 1
else
	git clone https://github.com/navisecdelta/EmailGen
	cd EmailGen
	sudo gem install bundler:1.16.6
	bundle install
fi

# Neos-Mail Spoofer
if [[ -d 'Neos_Spoofer' ]]; then
	sleep 1
else 
	wget https://github.com/s1l3nt78/Private/raw/master/TigerShark%20Extras/Neos_Spoofer.zip
	unzip Neos_Spoofer.zip
	rm Neos_Spoofer.zip
fi

# CVE-2018-8174
if [[ -d 'CVE-2018-8174-msf' ]]; then
	sleep 2
else
	git clone https://github.com/Yt1g3r/CVE-2018-8174_EXP.git
fi

# Phantom-Evasion
if [[ -d 'Phantom-Evasion' ]]; then
	sleep 1
else 
	git clone https://github.com/oddcod3/Phantom-Evasion.git
	cd Phantom-Evasion
	python3 phantom-evasion.py --setup
fi

# EvilURL
if [[ -d 'EvilURL' ]]; then
	sleep 1
else 
	git clone https://github.com/UndeadSec/EvilURL.git
fi

# Cr3d0v3r
if [[ -d 'Cr3d0v3r' ]]; then
	sleep 1
else
	git clone https://github.com/D4Vinci/Cr3dOv3r.git
	cd Cr3dOv3r
	python3 -m pip install -r requirements.txt
	python3 Cr3d0v3r.py -h
fi

# SpookFlare
if [[ -d 'SpookFlare' ]]; then
	sleep 1
else
	git clone https://github.com/hlldz/SpookFlare.git
	cd SpookFlare
	pip install -r requirements.txt
fi

# ThunderShell
if [[ -d 'ThunderShell' ]]; then
	sleep 1
else
	git clone https://github.com/Mr-Un1k0d3r/ThunderShell.git
fi

# AdvPhishing
if [[ -d 'AdvPhishing' ]]; then
	sleep 1
else
	git clone https://github.com/Ignitetch/AdvPhishing.git
	cd AdvPhishing
	chmod 777 setup.sh
	sudo ./setup.sh
fi
reset

echo -e "${RED}Is this the first time install tigershark or are you updating?(i/u)${NC}"
read UPQ
if [[ $UPQ == "i" ]]; then
	pwd 
	cd ..
	sudo mv TigerShark -t /opt
	sudo chown $USER:$USER -R /opt/TigerShark
	echo -e "${W}Would you like tigershark to be able to be run from anywhere?(y/n)${NC}"
	read ANY
	if [[ ${ANY} == "y" ]]; then
		cd /opt/TigerShark
		sudo cp tigershark -t /usr/sbin
		sudo chown $USER:$USER /usr/sbin/tigershark
	else
		sleep 1
	fi
	echo -e "${W}Please change SocialFish App Key in 'SocialFish/core/config.py'${NC}"
	echo -e "${W}GoPhish default login is admin:gophish${NC}"
else
	if [[ -f /usr/sbin/tigershark ]]; then
		cd /opt/TigerShark
		sudo cp tigershark -t /usr/sbin
		sudo chown $USER:$USER /usr/sbin/tigershark
	else
		sleep 1
	fi
fi


