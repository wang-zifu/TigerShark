#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'

cd tools/SocialFish
echo -e "${ORNG}"
figlet -f mini "SocialFish"
echo -e "${NC}"
echo -e "${W}Please enter a login name for SocialFish Server${NC}"
read USER
echo -e "${W}Please enter a password for SocialFish Server${NC}"
read PASS
sudo python3 SocialFish.py ${USER} ${PASS}
cd ../..
./tigershark
