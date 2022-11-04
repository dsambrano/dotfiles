#!/usr/bin/env bash

sudo systemclt enable cron.service
sudo systemclt start cron.service

sudo dnf install cronie
# https://www.baeldung.com/linux/create-crontab-script
crontab -l > crontab_new
echo "0,30 8-23 * * * /home/buddy/git_repos/local_functions/shell/change_wallpaper.sh" >> crontab
crontab crontab_new

rm crontab
