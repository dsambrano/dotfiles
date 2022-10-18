#!/usr/bin/env bash

## Installing GoXLR setup:
LOCATION=$( curl -s "https://api.github.com/repos/GoXLR-on-Linux/goxlr-utility/releases" \
    | grep "browser_download_url.*.rpm" \
    | head -1 \
    | sed 's/.* //' \
    | cut -d '"' -f 2) # Removes Double Quotes: https://stackoverflow.com/a/35636517
wget $LOCATION
sudo rpm -i goxlr*rpm # Source: https://phoenixnap.com/kb/how-to-install-rpm-file-centos-linux https://www.cyberciti.biz/faq/rhel-redhat-fedora-opensuse-linux-install-rpmfile-command/
sudo dnf install goxlr-utility
cd git_repos
g clone git@github.com:GoXLR-on-Linux/goxlr-ui.git
cd goxlr-ui
npm install
npm run serve

