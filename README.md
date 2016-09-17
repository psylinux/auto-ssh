# remote_ssh.sh
This script will mount a remote file system using ssh and will open a ssh session with X11 Forward activated.
You must set the Environment Variables first in order to use this script


## Set environment variables
RSA_KEY="/home/user/.ssh/id_rsa"                # Your RSA private key
MNT_POINT="/home/user/mount_here"               # The mount point you like
REMOTE_IP="domain.com"                          # The remote IP or domain (FQDN)
REMOTE_USER="root"                              # Remote user to connect through ssh
REMOTE_DIR="/root"                              # The remote directory to mount
REMOTE_SSH_PORT="22"                            # SSH Port (Default: 22)

