# auto-ssh.sh

This script will mount a auto file system using ssh and will open a ssh session with X11 Forward activated.
You must set the Environment Variables first in order to use this script.


## How to Install

git clone https://github.com/psylinux/auto-ssh.git

## Edit auto_ssh.sh and Set environment variables
	- Your RSA private key: RSA_KEY="/home/user/.ssh/id_rsa"
	- The mount point you like: MNT_POINT="/home/user/mount_here"
	- Remote IP or domain (FQDN): REMOTE_IP="domain.com"
	- Remote user to connect through ssh: REMOTE_USER="root"
	- Remote directory to mount: REMOTE_DIR="/root"
	- SSH Port (Default: 22): REMOTE_SSH_PORT="22"


## How to use

```sh
$ cd auto-ssh/
$ chmod +x auto-ssh.sh
$ ./auto-ssh.sh
```
