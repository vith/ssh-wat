#!/usr/bin/env bash

set -o nounset
set -o errexit
trap 'echo "Aborting due to errexit on line $LINENO. Exit code: $?" >&2' ERR
set -o errtrace
set -o pipefail
set -o xtrace

# set up ssh client identity/config
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -N ''
cat ~/.ssh/id_ed25519.pub >> ~/.ssh/authorized_keys
echo HashKnownHosts=no > ~/.ssh/config
echo StrictHostKeyChecking=no >> ~/.ssh/config

# start sshd
service ssh start

# learn the host fingerprint
ssh localhost 'printf "\033[0;32m HELLO \033[0m\n"'

# generate new host identity
rm -v /etc/ssh/ssh_host_*
dpkg-reconfigure openssh-server

# see if fingerprint verification is effective
ssh localhost 'printf "\033[0;33m HELLO AGAIN \033[0m\n"'

# if we get here, wat?
printf "\033[0;31m UH OH, WHY'D THAT WORK? \033[0m\n"
