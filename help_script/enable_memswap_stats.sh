#!/bin/bash
##Verify docker config
##Add entry grub for memory/swap stats

echo " -> DL and exec check_config docker"
mkdir tmpchk
curl https://raw.githubusercontent.com/docker/docker/master/contrib/check-config.sh > tmpchk/check-config.sh; chmod 755 tmpchk/check-config.sh; tmpchk/check-config.sh > tmpchk/check_config.txt

echo " -> Verify docker info"
result=$(grep -i "cgroup swap accounting is currently not enabled" tmpchk/check_config.txt)
echo $result
if [ ! -z "$result" ]
then
	echo " -> Add new line in Grub file for enable swap and mem docker stats"
	echo "GRUB_CMDLINE_LINUX=\"cgroup_enable=memory swapaccount=1\"" >> /etc/default/grub
fi

echo " -> Clean tmpdir"
rm -rf tmpchk

echo " -> Update Grub"
update-grub

echo ""
echo " -> Please reboot now..." 
