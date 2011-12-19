#!/bin/bash

# Kitty/Flare183's SCP Screenshot Uploader
# Requires: scp, scrot, xclip, and zenity
# 
# Instructions: Install dependencies, configure below,
# set up SSH keys with the server you are uploading to,
# and bind to a key in your desktop environment.

# SSH Server (ex. example.com)
sshserver=""
# SSH Username (ex. root)
sshuser=""
# Upload File Path (ex. /var/www/)
uploadpath=""
# Associated website (ex. http://example.com/)
uploadsite=""
# Screenshot string
sstring="`date +%d_%m_%y_%H_%M_%S.png`"
# End of config

scrot "/tmp/$sstring"
scp "/tmp/$sstring" "$sshuser@$sshserver:$uploadpath"
rm "/tmp/$sstring"
echo -n "$uploadsite$sstring" | xclip -selection p
echo -n "$uploadsite$sstring" | xclip -selection s
echo -n "$uploadsite$sstring" | xclip -selection c
echo -e "message:Screenshot Saved: $sstring" | zenity --notification --listen
echo "$uploadsite$sstring"