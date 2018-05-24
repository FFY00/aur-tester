#!/bin/bash
set -e

# Create user
useradd -m -g wheel -s /bin/sh tester
echo "tester ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Install revenge repo (for yaourt)
echo "[revenge_repo]" >> /etc/pacman.conf
echo "SigLevel = Optional TrustAll" >> /etc/pacman.conf
echo "Server = https://raw.github.com/obrevenge/revenge_repo/master/x86_64" >> /etc/pacman.conf
echo "Server = https://downloads.sourceforge.net/project/revenge-repo/revenge_repo/x86_64" >> /etc/pacman.conf
echo "Server = ftp://ftp.heanet.ie/mirrors/sourceforge/r/re/revenge-repo/revenge_repo/x86_64" >> /etc/pacman.conf

# Install base packages
pacman -Sy base-devel sudo binutils fakeroot yaourt --noconfirm

# Install package
su -c "yaourt -Sy $@" tester
su -c "yaourt -Qi $@ -noconfirm" tester
