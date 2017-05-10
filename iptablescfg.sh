#!/bin/bash
iptables -F -t filter
iptables -X -t filter
iptables -Z -t filter
iptables -F -t nat
iptables -X -t nat
iptables -Z -t nat
iptables -t filter -P INPUT DROP
iptables -t filter -P OUTPUT ACCEPT
iptables -t filter -P FORWARD ACCEPT
iptables -A INPUT -p ALL -i lo -j ACCEPT
iptables -A INPUT -p tcp -s 192.168.138.0/24 --dport 2259 -j ACCEPT

#kick off nmap:
iptables -A INPUT -p tcp --tcp-flags ALL FIN,URG,PSH -j REJECT
iptables -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -j REJECT
iptables -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j REJECT




