#!/bin/bash
#
# Copyright 2020 Marcos Azevedo (aka pylinux) : psylinux[at]gmail.com
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
#
# Description:  This script will mount a remote file system using ssh and will open a ssh session with X11 Forward activated.
#               You must set the Environment Variables first in order to use this script
#

# Set environment variables
RSA_KEY="/home/user/.ssh/id_rsa"    # Your RSA private key
MNT_POINT="/home/user/mount_here"	# The mounting point you like
REMOTE_IP="domain.com"              # The remote IP or domain (FQDN)
REMOTE_USER="root"                  # Remote user to connect through ssh
REMOTE_DIR="/root"                  # The remote directory to mount
REMOTE_SSH_PORT="22"				# SSH Port (Default: 22)


echo "---------------------------------------------------------------------------"

# Checking for sshfs
if [[ `dpkg -l | grep sshfs` == "" ]]; then
{
	echo " In order to use this script you must install sshfs first!"
	echo " [+] Installing sshfs..."
	sudo apt-get update && sudo apt-get -y install sshfs
}
fi

# Creating Mount Point Directory
if [ ! -d $MNT_POINT ]; then
	mkdir -p $MNT_POINT
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
			echo "	[+] Unmounting $MNT_POINT"
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

echo -e "---------------------------------------------------------------------------\n"
