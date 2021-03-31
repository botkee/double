#!/bin/bash

apt install tor -y

echo -e "Enter IP of first server: eg 111.111.111.111  : 

after successful login please run wget https://raw.githubusercontent.com/botkee/double/main/second.sh && chmod +x second.sh && bash second.sh

"; read IP2;


torsocks ssh root@$IP2

torsocks scp -T root@IP2:"/root/client.tar /root/run1.sh" /root/

bash /root/run1.sh
