#!/usr/bin/env bash

echo "=== NIX UPDATER ==="
echo "1) Update system"
echo "2) Reboot"
echo "3) Garbage cleanup (older than 20 days)"
echo "4) Exit"
echo "5) Edit the nix configuration file"
echo

read -p "Choose an option [1-5]: " choice

case "$choice" in
    1)
        echo "Updating system..."
        nixos-rebuild switch --upgrade
        ;;
    2)
        echo "Reboot..."
        reboot
        ;;
    3)
        echo "Cleaning up garbage older than 20 days..."
        nix-collect-garbage --delete-older-than 20d
        ;;
    4)
        echo "Exiting."
        exit 0
        ;;
    5)
        echo "Edit nix configuration file."
        nano /etc/nixos/configuration.nix 0
        ;;
    *)
        echo "Invalid choice."
        exit 1
        ;;
esac
