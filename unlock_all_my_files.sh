#!/bin/bash
echo Searching files locked by $1
files=`git lfs locks | awk -n "/$1/{print $2}" | cut -d$'\t' -f1`

echo "Following files will be unlocked:"
echo "$files"

# Color Codes
RED='\033[1;31m'
DARKRED='\033[0;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
MAGENTA='\033[1;35m'
NOCOLOR='\033[0m'

while true; do
     echo -e "Unlock this files? (${GREEN}y${NOCOLOR}/${RED}n${NOCOLOR})"
     read yn
     case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
     esac
done

echo "$files" | xargs git lfs unlock 
