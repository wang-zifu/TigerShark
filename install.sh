#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'
sudo apt-get install golang-1.11 golang-1.11-go golang-1.11-src git python2 python3 python3-pip python3-dev python3 virtualenv gnupg certbot wine wine64
echo -e "${YLW}This script will download and install all the tools needed for TigerShark to run."
echo -e "If this is okay, hit ${LP}enter${YLW} - otherwise ${RED}Ctrl${W} + ${RED}c ${YLW}to cancel${NC}"
read ACCEPT
if [[ -d '/opt/TigerShark' ]]; then
	sleep 1
else
	pwd
	cd .. 
	sudo mv TigerShark -t /opt
	sudo chown $USER:$USER -R /opt/TigerShark
fi
echo -e "${LP}==========================================================================${NC}"
cd /opt/TigerShark
chmod +x tigershark
# Toolinstallations
if [[ -d 'tools' ]]; then
	sleep 1
else
	mkdir tools
fi
cd /opt/TigerShark/tools

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

cd /opt/TigerShark/tools
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

cd /opt/TigerShark/tools
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

cd /opt/TigerShark/tools
#WeeMan
if [[ -d 'weeman' ]]; then
	sleep 1
else
	git clone https://github.com/evait-security/weeman.git
fi

cd /opt/TigerShark/tools
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

cd /opt/TigerShark/tools
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

cd /opt/TigerShark/tools
#PhishBait - Email harvester for attacks. (done)
if [[ -d 'PhishBait' ]]; then
	sleep 1
else
	git clone https://github.com/pan0pt1c0n/PhishBait.git
	echo -e "${W}PhishBait Installed${NC}"
fi

cd /opt/TigerShark/tools
#STP - Node based phishing server (done)
if [[ -d 'STP' ]]; then
	sleep 1
else
	git clone https://github.com/PowerScript/STP.git
	echo -e "${W}STP Installed${NC}"
fi

cd /opt/TigerShark/tools
#HiddenEye (done)
if [[ -d 'HiddenEye' ]]; then
	rm -rf HiddenEye
	git clone https://github.com/Soldie/HiddenEye-DarkSecDevelopers
	cd HiddenEye-DarkSecDevelopers
	pip3 install -r requirements.txt
fi
if [[ -d 'HiddenEye-DarkSecDevelopers' ]]; then
	sleep 1
else
	git clone https://github.com/Soldie/HiddenEye-DarkSecDevelopers
	cd HiddenEye-DarkSecDevelopers
	sudo pip3 install -r requirements.txt
	sudo pip3 install requests
	echo -e "${W}HiddenEye Installed${NC}"
	cd ..
fi

cd /opt/TigerShark/tools
# PhEmail
if [[ -d 'PhEmail' ]]; then
	sleep 1
else
	git clone https://github.com/Dionach/PhEmail
fi

cd /opt/TigerShark/tools
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

cd /opt/TigerShark/tools
# CredSniper
if [[ -d 'CredSniper' ]]; then
	sleep 1
else
	git clone https://github.com/s1l3nt78/CredSniper.git
	cd CredSniper
	sudo python3 -m pip install -r requirements.txt
	chmod +x install.sh
	./install.sh
	cd ..
fi

cd /opt/TigerShark/tools
# Enigma
if [[ -d 'Enigma' ]]; then
	sleep 1
else 
	git clone https://github.com/UndeadSec/Enigma.git
fi

cd /opt/TigerShark/tools
# Pupy
if [[ -d 'pupy' ]]; then
	sleep 1
else
	git clone --recursive https://github.com/n1nj4sec/pupy.git
	cd pupy
	sudo python2 -m pip install virtualenv
	sudo python create-workspace.py pupyw
	sleep 5
	mv /opt/TigerShark/.vs/pupy.conf.default -t /opt/TigerShark/tools/pupy/pupy
fi

cd /opt/TigerShark/tools
# ie11 VB Exploit
if [[ -d 'ie11_vbscript_exploit' ]]; then
	sleep 1
else
	git clone https://github.com/ruthlezs/ie11_vbscript_exploit.git
fi

cd /opt/TigerShark/tools
# EmailGen
if [[ -d 'EmailGen' ]]; then
	sleep 1
else
	git clone https://github.com/navisecdelta/EmailGen
	cd EmailGen
	sudo gem install bundler:1.16.6
	bundle install
fi

cd /opt/TigerShark/tools
# Neos-Mail Spoofer
if [[ -d 'Neos_Spoofer' ]]; then
	sleep 1
else 
	mv /opt/TigerShark/.vs/Neos_Spoofer.zip -t .
	unzip Neos_Spoofer.zip
	rm Neos_Spoofer.zip
fi

cd /opt/TigerShark/tools
# CVE-2018-8174
if [[ -d 'CVE-2018-8174_EXP' ]]; then
	sleep 2
else
	git clone https://github.com/Yt1g3r/CVE-2018-8174_EXP.git
fi

cd /opt/TigerShark/tools
# Phantom-Evasion
if [[ -d 'Phantom-Evasion' ]]; then
	sleep 1
else 
	git clone https://github.com/oddcod3/Phantom-Evasion.git
	cd Phantom-Evasion
	python3 phantom-evasion.py --setup
fi

cd /opt/TigerShark/tools
# EvilURL
if [[ -d 'EvilURL' ]]; then
	sleep 1
else 
	git clone https://github.com/UndeadSec/EvilURL.git
fi

cd /opt/TigerShark/tools
# Cr3d0v3r
if [[ -d 'Cr3dOv3r' ]]; then
	sleep 1
else
	git clone https://github.com/D4Vinci/Cr3dOv3r.git
	cd Cr3dOv3r
	python3 -m pip install -r requirements.txt
	python3 Cr3d0v3r.py -h
fi

cd /opt/TigerShark/tools
# SpookFlare
if [[ -d 'SpookFlare' ]]; then
	sleep 1
else
	git clone https://github.com/hlldz/SpookFlare.git
	cd SpookFlare
	pip install -r requirements.txt
fi

cd /opt/TigerShark/tools
# ThunderShell
if [[ -d 'ThunderShell' ]]; then
	sleep 1
else
	git clone https://github.com/Mr-Un1k0d3r/ThunderShell.git
fi

cd /opt/TigerShark/tools
# AdvPhishing
if [[ -d 'AdvPhishing' ]]; then
	sleep 1
else
	git clone https://github.com/Ignitetch/AdvPhishing.git
	cd AdvPhishing
	chmod 777 setup.sh
	sudo ./setup.sh
fi

# CuteIt
cd /opt/TigerShark/tools
if [[ -d 'Cuteit' ]]; then
	sleep 1
else
	git clone https://github.com/D4Vinci/Cuteit.git
fi

cd /opt/TigerShark/tools
#Macro_Pack
if [[ -d 'macro_pack' ]]; then
	sleep 1
else 
	git clone https://github.com/sevagas/macro_pack.git
	cd macro_pack
	python3 -m pip install -r requirements.txt
	python3 -m pip install pyinstaller
	mkdir bin
	cd bin
	wget https://github.com/sevagas/macro_pack/releases/download/v1.7/macro_pack.exe
fi

cd /opt/TigerShark/tools
# Graffiti
if [[ -d 'Graffiti' ]]; then
	sleep 1
else 
	git clone https://github.com/Ekultek/Graffiti.git
	cd Graffiti
	chmod +x install.sh
	sudo ./install.sh
fi

cd /opt/TigerShark/tools
# Merlin
if [[ -d 'merlin' ]]; then
	sleep 1
else
	mkdir merlin
	cd merlin
	wget https://github.com/Ne0nd0g/merlin/releases/download/v0.8.0/merlinServer-Linux-x64-v0.8.0.BETA.7z
	wget https://github.com/Ne0nd0g/merlin/releases/download/v0.8.0/merlinAgent-Windows-x64-v0.8.0.BETA.7z
	wget https://github.com/Ne0nd0g/merlin/releases/download/v0.8.0/merlinAgent-Linux-x64-v0.8.0.BETA.7z
	wget https://github.com/Ne0nd0g/merlin/releases/download/v0.8.0/merlinAgent-Darwin-x64-v0.8.0.BETA.7z
	wget https://github.com/Ne0nd0g/merlin/releases/download/v0.8.0/merlinAgent-DLL-v0.8.0.BETA.7z
	mkdir zips && mv *.7z -t zips
	echo -e "${RED}Will unzip necessary files for merlin."
	echo -e "when prompted for a password, enter ${LP}merlin${NC}"
	7z x zips/merlinServer-Linux-x64-v0.8.0.BETA.7z -y
	7z x zips/merlinAgent-Windows-x64-v0.8.0.BETA.7z -y
	7z x zips/merlinAgent-Linux-x64-v0.8.0.BETA.7z -y
	7z x zips/merlinAgent-Darwin-x64-v0.8.0.BETA.7z -y
else
	git clone https://github.com/MRGEffitas/
	bundle install
fi

#EvilReg
cd /opt/TigerShark/tools
if [[ ! -d 'evilreg' ]]; then
	git clone https://github.com/thelinuxchoice/evilreg
fi

#FakeMailer
cd /opt/TigerShark/tools
if [[ ! -d 'fakemailer' ]]; then
	git clone https://github.com/Technowlogy-Pushpender/fakemailer.git
fi

#GetDroid
cd /opt/TigerShark/tools
if [[ ! -d 'getdroid' ]]; then
	git clone https://github.com/khawabkashyap/getdroid.git
	sudo apt-get install openjdk-11-source
	chmod +x getdroid.sh
fi

#apkinfector
cd /opt/TigerShark/tools
if [[ ! -d 'apkinfector' ]]; then
	git clone https://github.com/Technowlogy-Pushpender/apkinfector.git
fi

#PhishMailer
cd /opt/TigerShark/tools
if [[ ! -d 'PhishMailer' ]]; then
	git clone https://www.github.com/BiZken/PhishMailer.git
	chmod +x PhishMailer.py
fi
reset

echo -e "${RED}Is this the first time install tigershark or are you updating?(i/u)${NC}"
read UPQ
if [[ $UPQ == "i" ]]; then 
	cd /opt
	sudo chown $USER:$USER -R /opt/TigerShark
	echo -e "${W}Would you like tigershark to be able to be run from anywhere?(y/n)${NC}"
	read ANY
	if [[ ${ANY} == "y" ]]; then
		cd /opt/TigerShark
		chmod +x tigershark
		sudo cp tigershark -t /usr/sbin
		sudo chown $USER:$USER /usr/sbin/tigershark
	else
		sleep 1
	fi
	echo -e "${W}Please change SocialFish App Key in 'SocialFish/core/config.py'${NC}"
	echo -e "${W}GoPhish default login is ${RED}admin${W}:${RED}gophish${NC}"
else
	if [[ -f /usr/sbin/tigershark ]]; then
		cd /opt/TigerShark
		chmod +x tigershark
		sudo cp tigershark -t /usr/sbin
		sudo chown $USER:$USER /usr/sbin/tigershark
	else
		sleep 1
	fi
fi
sudo chown $USER:$USER -R /opt/TigerShark

