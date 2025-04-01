#!/bin/bash

SOURCE='/'
DESTINATION="/snapshots/$(date '+%d-%m-%Y_%H-%M-%S')"

# https://wiki.archlinux.org/title/Rsync#Full_system_backup
sudo rsync -aAXHv \
    --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found","/snapshots","/home/*"} \
    ${SOURCE} ${DESTINATION}

if [ $? -eq 0 ]; then
    echo "Backup completed successfully"
else
    echo "Some error occurred during backup"
fi
