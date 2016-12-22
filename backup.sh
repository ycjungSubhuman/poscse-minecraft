#!/bin/sh
# init git repository with "git init" command
# minecraft server is running on screen named "minecraft"
# ^M means newline character. type c-V-M in your editor
# put this file in your minecraft server's directory
# edit crontab with "crontab -e" and add this line:
# 0 12 * * * /path/to/minecraft/backup.sh > /dev/null 2>&1

CWD=$(readlink -f `dirname $0`)
screen -S minecraft -X stuff "say [Backup] Server goes volatile for backup in 10 seconds^M"
sleep 10
screen -S minecraft -X stuff "say [Backup] World is now volatile. Things may not be auto-saved for a short moment.^M"
screen -S minecraft -X stuff "save-off^M"
screen -S minecraft -X stuff "save-all^M"
sleep 5
cd $CWD
git add . 
git commit -a -m"daily backup"
screen -S minecraft -X stuff "say [Backup] World is auto-saved.^M"
screen -S minecraft -X stuff "save-on^M"
screen -S minecraft -X stuff "say [Backup] Done...^M"
git push origin master


