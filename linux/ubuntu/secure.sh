#!/usr/bin/env bash
# Increases security follows: https://www.youtube.com/watch?v=eeaFoZlSq6I
# https://www.youtube.com/watch?v=ZhMw53Ud2tY
# https://www.youtube.com/watch?v=fKuqYQdqRIs


# Only allow SSH from local hosts: https://stackoverflow.com/a/32222907
echo "sshd: ALL EXCEPT LOCAL" >> /etc/hosts.deny
