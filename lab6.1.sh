#!/bin/bash

cat /etc/hosts | while read ip name rest; do
if [ -n "$name" ]; then
real_ip=$(nslookup "$name" 2>/dev/null | grep -A1 "Name:" | grep "Address:" | awk '{print $2}')
if [ -n "$real_ip" ] && [ "$real_ip" != "$ip" ]; then
echo "Bogus IP for $name in /etc/hosts!"
fi
#echo "$ip $real_ip $name"
fi
done
