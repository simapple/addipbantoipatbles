#!/bin/sh
for ip in $(cat $1 | awk '{a[$1]++}END{for(i in a){ print i":"a[i]}}' | sort -t: -r -n  -k2 | uniq | head -20|cut -d: -f1)
do
	echo $ip" will be banned"
	iptables -A INPUT -s $ip -j DROP

done
service iptables save  
