#!/bin/bash

echo "Welcome to Disk Utilization Application."
echo "We will send you mail when disk utiliztion exceeds 80% for / and /boot."

echo "Checking will happen for every 60 minutes"
echo "Press ctrl+c to stop the process. Thanks."
while true; do
disk=$(df -Ph | grep '/boot' | awk {'print $5'})
#mention limit you need
max=80%
if [ ${disk%?} -ge ${max%?} ]; then
#email id will be root@localhost.localdomain
echo "$(hostname) has used $disk at $(date)" | mail -s "Disk space alert on $(hostname): $disk used" root@localhost.localdomain
fi
disk1=$(df -Ph | grep '/' | awk {'print $5'} | sed -n '5p')
#mention limit you need
max1=80%
if [ ${disk1%?} -ge ${max1%?} ]; then
#email id will be root@localhost.localdomain
echo "$(hostname) has used $disk1 at $(date)" | mail -s "Disk space alert on $(hostname): $disk1 used" root@localhost.localdomain
fi
#time period to check
sleep 60m
done
