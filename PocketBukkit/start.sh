#!/bin/sh
  BINDIR=$(dirname "$(readlink -fn "$0")")
  cd "$BINDIR"

  FORMAT_BLACK='\e[0;30m'
  FORMAT_BLUE='\e[0;34m'
  FORMAT_GREEN='\e[0;32m'
  FORMAT_CYAN='\e[0;36m'
  FORMAT_RED='\e[0;31m'
  FORMAT_PURPLE='\e[0;35m'
  FORMAT_ORANGE='\e[0;33m'
  FORMAT_LIGHTGRAY='\e[0;37m'
  FORMAT_DARKGRAY='\e[1;30m'
  FORMAT_LIGHTBLUE='\e[1;34m'
  FORMAT_LIGHTGREEN='\e[1;32m'
  FORMAT_LIGHTRED='\e[1;31m'
  FORMAT_LIGHTPURPLE='\e[1;35m'
  FORMAT_YELLOW='\e[1;33m'
  FORMAT_WHITE='\e[1;37m'
  FORMAT_RESET='\e[0m'

  echo -e "${FORMAT_YELLOW} ____            _        _   ___  _   _  _     _     _    _   "
  echo -e "${FORMAT_YELLOW}|  _ \ ___   ___| | _____| |_|   \| | | || | __| | __|_| _| |_ "
  echo -e "${FORMAT_YELLOW}| |_) / _ \ / __| |/ / _ \ __|  _/| | | || |/ /| |/ / _ |__ __|"
  echo -e "${FORMAT_YELLOW}|  __/ (_) | (__|   <  __/ |_|   \| |_| ||   < |   < | |  | |  "
  echo -e "${FORMAT_YELLOW}|_|   \___/ \___|_|\_\___|\__|___/\_____/|_|\_\|_|\_\|_|  |_|  "
  echo -e "${FORMAT_LIGHTGRAY}PocketBukkit Is Currently Processing Your Request..."

  shopt -s expand_aliases

  #Using Alias Makes This Easier And Faster
  type wget > /dev/null 2>&1
  if [ $? -eq 0 ]; then
      alias download_file="wget --no-check-certificate -q -O -"
  else
      type curl >> /dev/null 2>&1

  if [ $? -eq 0 ]; then
      alias download_file="curl --insecure --silent --location"
  else
      clear
      echo -e "${FORMAT_YELLOW} ____            _        _   ___  _   _  _     _     _    _   "
      echo -e "${FORMAT_YELLOW}|  _ \ ___   ___| | _____| |_|   \| | | || | __| | __|_| _| |_ "
      echo -e "${FORMAT_YELLOW}| |_) / _ \ / __| |/ / _ \ __|  _/| | | || |/ /| |/ / _ |__ __|"
      echo -e "${FORMAT_YELLOW}|  __/ (_) | (__|   <  __/ |_|   \| |_| ||   < |   < | |  | |  "
      echo -e "${FORMAT_YELLOW}|_|   \___/ \___|_|\_\___|\__|___/\_____/|_|\_\|_|\_\|_|  |_|  "
      echo -e "${FORMAT_RED}PocketBukkit Was Unable To Process Your Request!"
      echo -e "${FORMAT_RED}------------------------------------------------"
      echo -e "${FORMAT_RED}-----------------[ERROR REPORT]-----------------"
      echo -e "${FORMAT_RED}------------------------------------------------"
      echo -e "${FORMAT_RED}    CURL/WGET Does Not Exist On Your Machine    "
      echo -e "${FORMAT_RED}------------------------------------------------"
      echo -e "${FORMAT_RED}---------------[END ERROR REPORT]---------------"
      echo -e "${FORMAT_RED}------------------------------------------------"
      exit 1
  fi
fi

  sleep 3
  clear

  if [ -f ./PocketBukkit.jar ]; then

      UNAME_M=$(uname -m)
      IS_IOS=$(expr match $UNAME_M 'iP[a-zA-Z0-9,]*' 2> /dev/null)
      #IS_RPI=$?
      #IS_ODROID=$?

      echo -e "${FORMAT_LIGHTPURPLE}Starting PocketBukkit...${FORMAT_RESET}"

      if [ "$IS_IOS" == 0 ]; then
          java -Xmx512M -jar PocketBukkit.jar -o true
      #elif [ "IS_RPI" == 0 ]; then
          #java -Xmx512M -jar PocketBukkit.jar -o true
      #elif [ "IS_ODROID" == 0 ]; then
          #java -Xmx512M -jar PocketBukkit.jar -o true
      else
          java -Xmx512M -jar PocketBukkit.jar -o true
      fi

  else

  echo -e "${FORMAT_RED}[ERROR] No PocketBukkit JAR File Found!${FORMAT_RESET}"
  echo -e "${FORMAT_LIGHTPURPLE}Running Auto-Installer..."

  echo -e "${FORMAT_LIGHTGRAY}---------------------------------"
  echo -e "${FORMAT_CYAN}[1/2] Downloading PocketBukkit..."
  set +e
  download_file "http://PocketBukkit.net/download/latest"

  if [ -f ./PocketBukkit.jar ]; then
      alldone=yes
  else
      alldone=no
  fi

  if [ "$alldone" == "yes" ]; then
      echo -e "${FORMAT_GREEN}[INFO] ${FORMAT_RESET}Download Successful!"
      echo -e "${FORMAT_LIGHTGRAY}---------------------------------"
      echo -e "${FORMAT_GREEN}[INFO] ${FORMAT_RESET}Continuing To Next Step..."
      echo -e "${FORMAT_LIGHTGRAY}---------------------------------"
      echo -e "${FORMAT_CYAN}[2/2] Cleaning Up..."
          echo -e "${FORMAT_GREEN}[INFO] ${FORMAT_RESET}Removing 'start.cmd'..."
          rm -f ./start.cmd
          echo -e "${FORMAT_GREEN}[INFO] ${FORMAT_RESET}Removing 'start.bat'..."
          rm -f ./start.bat
      echo -e "${FORMAT_GREEN}[INFO] ${FORMAT_RESET}Cleanup Complete!"
      echo -e "${FORMAT_LIGHTGRAY}---------------------------------"
      echo -e "${FORMAT_ORANGE}Please Re-Run ./start.sh To Start PocketBukkit${FORMAT_RESET}"

  else
      echo -e "${FORMAT_RED}[ERROR] Download Failed!"
      echo -e "${FORMAT_LIGHTGRAY}---------------------------------${FORMAT_RESET}"
  fi
      exit 1
fi
