#!/bin/bash
#
# Vatra Networks - http://www.vatra.com.br
# Marcos Azevedo (marcos@vatra.com.br)
#
# Description: This script will mount a remote file system using ssh and will open a ssh session with X11 Forward activated.
 

# Set environment variables
RSA_KEY="/home/psylinux/.ssh/id_rsa"
MNT_POINT="/home/psylinux/Documents/KaliFS"
REMOTE_IP="kali"
REMOTE_USER="root"
REMOTE_DIR="/root/Documents"
REMOTE_SSH_PORT="222"


echo "---------------------------------------------------------------------------"

if [[ `dpkg -l | grep sshfs` == "" ]]; then
{
	echo " In order to use this script you must install sshfs first!"		
	echo " [+] Installing sshfs..."
	sudo apt-get update && sudo apt-get -y install sshfs
	echo -e "---------------------------------------------------------------------------\n"
}
fi

if [[ "$1" == "-c" ]]; then
	if [[ `mount | grep $MNT_POINT` ]]; then
	{
		echo "	[+] Remote File System Mounted in $MNT_POINT"
	}	
	else 
	{
		echo "	[+] One moment please..."
		sshfs -p $REMOTE_SSH_PORT -o allow_other,auto_cache,reconnect,IdentityFile=$RSA_KEY $REMOTE_USER@$REMOTE_IP:$REMOTE_DIR $MNT_POINT 
		echo "	[+] Remote File System Mounted in $MNT_POINT"
	}
	fi
	echo -e "---------------------------------------------------------------------------\n"
	ssh -Y $REMOTE_USER@$REMOTE_IP -p $REMOTE_SSH_PORT
	else if [[ "$1" == "-d" ]]; then
		{
			sudo umount $MNT_POINT
			echo "	[+] Umounting $MNT_POINT"
			echo -e "---------------------------------------------------------------------------\n"
		}
		else 
		{  
			echo "Usage: $0 [-c | -d]"
			echo "Examples:"
			echo "	$0 -c (Will Connect)"
			echo "	$0 -d (Will Disconnect)"
		}
	fi
fi

