# remote_ssh.sh

This script will mount a remote file system using ssh and will open a ssh session with X11 Forward activated.
You must set the Environment Variables first in order to use this script


## Set environment variables
	- Your RSA private key RSA_KEY="/home/user/.ssh/id_rsa"

	- The mount point you like MNT_POINT="/home/user/mount_here"

	- Remote IP or domain (FQDN) REMOTE_IP="domain.com"

	- Remote user to connect through ssh REMOTE_USER="root"

	- Remote directory to mount REMOTE_DIR="/root" 

	- SSH Port (Default: 22) REMOTE_SSH_PORT="22"


