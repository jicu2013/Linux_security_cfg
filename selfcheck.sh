#!/bin/bash

if  echo `id` | grep "root" 
then
printf "\n"
else
printf "please run as root\n"
exit
fi

printf "[+]system version:\n"
uname -a
printf "\n"


printf '[+]local machine ip：\\n'
ifconfig | grep --color "\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}"
echo ' '

printf  "[+]ssh service check\n"
if service sshd status | grep -E "listening on|active \(running\)"
then
service sshd status | grep -E "listening on|active"
else
echo "ssh service not open!"
fi
printf "\n"



printf  "[+]telnet service check\n"
if more /etc/xinetd.d/telnetd 2>&1|grep -E "disable=no"
then
echo  "telnet service open"
else
echo  "telnet service close "
fi
printf "\n"

printf '[+]list system port:\n'
lsof -i 
echo ' '






