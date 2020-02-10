#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'

echo -e "${ORNG}"
figlet -f mini "TigerShark"
echo -e "${NC}"
PS3='What would you like to do?'
        options=("Artemis" "CatPhish" "GoPhish" "HiddenEye" "PhishBait" "PhishX" "SocialFish" "STP" "Quit") 
        select opt in "${options[@]}"
        do
            case $opt in
                "Artemis")
                    echo -e "${W}Artemis${NC}"
                    ./scripts/artemis.sh
                    ;;

                "CatPhish")
                    echo -e "${W}CatPhish${NC}"
                    ./scripts/catphish.sh
                    ;;
                
                "GoPhish")
                    echo -e "${W}GoPhish{NC}"
                    ./scripts/gophish.sh
                    ;;

                "HiddenEye")
                    echo -e "${W}HiddenEye${NC}"
                    ./scripts/hiddeneye.sh
                    ;;

                "PhishBait")
                    echo -e "${W}PhishBait${NC}"
                    ./scripts/phishbait.sh
                    ;;

                "PhishX")
                    echo -e "${W}PhishX${NC}"
                    ./scripts/phishx.sh
                    ;;

                "SocialFish")
                    echo -e "${W}SocialFish${NC}"
                    ./scripts/socialfish.sh
                    ;;

                "STP")
                    echo -e "${W}STP${NC}"
                    ./scripts/stp.sh
                    ;;
            esac
        done