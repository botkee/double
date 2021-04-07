#!/bin/bash
#
#Usage login to first server and run this script: 
#
# wget https://raw.githubusercontent.com/botkee/double/main/start.sh && chmod +x start.sh && bash start.sh
#

NORMAL=`echo "\033[m"`
BRED=`printf "\e[1;31m"`
BGREEN=`printf "\e[1;32m"`
BYELLOW=`printf "\e[1;33m"`



apt update && apt upgrade -y

apt install tor -y

apt install sshpass -y

wget https://raw.githubusercontent.com/botkee/double/main/second.sh



echo -e "${BRED}After successful login please copy and run next command${NORMAL} :"
echo ""
echo -e "${BGREEN}wget https://raw.githubusercontent.com/botkee/double/main/second.sh && chmod +x second.sh && bash second.sh && exit${NORMAL}"

echo -e "${BYELLOW}Enter IP:PASSWORD of second server: eg 222.222.222.222:passw0rd2 ${NORMAL} : "; IFS=":" read -s IP2 SSHPASS;

ssh-keyscan $IP2 >> ~/.ssh/known_hosts

export SSHPASS

sshpass -e torsocks scp /root/second.sh root@$IP2:
sshpass -e torsocks ssh -o PasswordAuthentication=yes root@$IP2


#torsocks ssh root@$IP2

sshpass -e torsocks scp -T root@$IP2:"/root/client.tar /root/run1.sh" /root/

bash /root/run1.sh
