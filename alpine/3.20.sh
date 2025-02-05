#!/bin/sh

# Prereq
    #setup-alpine
    #reboot
# Auth
    apk add dbus, elogind, polkit-elogind
    rc-update add dbus, elogind, polkit
# Shell
    apk add bash fastfetch htop lf nano
    git pull st # build/install
# Config
    ## symlink -- bash, fastfetch, fonts, htop, lf, picom, x11

    ## nix --  https://gist.github.com/danmack/b76ef257e0fd9dda906b4c860f94a591
    # apk add sudo, shadow, curl, xz
    # add user to suoders
    # sh <(curl -L https://nixos.org/nix/install) --daemon 
    # ln -sf ../.files/nix/nix-daemon -> /etc/init.d/nix-daemon
    # chmod a+rx /etc/init.d/nix-daemon
    # ln -sf /root/.nix-profile/bin/nix-daemon -> /usr/sbin/nix-daemon
    # rc-update  add nix-daemon
    # rc-service nix-daemon start
    # sudo adduser bmeyer nixbld
    # Add nix to PATH
    
    ## Distro Tweaks
    # Faster boot https://www.reddit.com/r/AlpineLinux/comments/15fuq3f/some_tips_for_faster_boots/
# WM
    setup-xorg-base
    apk add picom
    git pull dwmblocks # build/install
    git pull dwm # build/install
    # setup dotfiles/symlinks
# DE
    apk add xf86-input-libinput
    setup-desktop plasma
    # remove junk
    # rice

    ## flatpak https://wiki.alpinelinux.org/wiki/Flatpak
    # apk add flatpak, xdg-desktop-portal, xdg-desktop-portal-kde
    # flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
reboot