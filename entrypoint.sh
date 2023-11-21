#!/bin/sh

# Check if both USERNAME and PASSWORD are set
if [ -z "$SMB_USERNAME" ] || [ -z "$SMB_PASSWORD" ]; then
  echo "ERROR: The SMB_USERNAME and SMB_PASSWORD environment variables must be set."
  exit 1
fi

# Add the Samba user
adduser -D "$SMB_USERNAME"
echo -e "$SMB_PASSWORD\n$SMB_PASSWORD" | smbpasswd -a -s "$SMB_USERNAME"

# Start Supervisor
exec supervisord -c /config/supervisord.conf
