#!/bin/bash

# Config
REPO_URL="YOUR_GITHUB_REPO_LINK_HERE"
TEMP_DIR="$HOME/Downloads/niri-dotfiles-GruvboxDark"
BACKUP_DIR="$HOME/.config-backup-$(date +%Y%m%d%H%M)"

# Welcome Screen
whiptail --title "Erda's Dotfiles Setup" --msgbox "This is the setup for erda's dotfiles.\n\nUse at your own risk. Press any key to start." 10 60

# Selection Menu
CHOICES=$(whiptail --title "Installation Menu" --checklist \
"Select components to install (Space to select, Enter to confirm):" 20 60 10 \
"UPDATE" "System update (pacman -Syyu)" ON \
"swaylock" "Screen locker" OFF \
"zathura" "PDF viewer" OFF \
"waybar" "Status bar" OFF \
"rofi" "App launcher, Wallpaper picker, Power menu" OFF \
"niri" "Window manager" OFF \
"mako" "Notification daemon" OFF \
"fish" "Shell" OFF \
"fastfetch" "System fetch" OFF \
"alacritty" "Terminal emulator" OFF 3>&1 1>&2 2>&3)

if [ $? -ne 0 ]; then
    echo "Aborted."
    exit 1
fi

# Start Process
{
    echo 10; sleep 1 # Progress start
    
    # 1. System Update
    if [[ $CHOICES == *"UPDATE"* ]]; then
        sudo pacman -Syyu --noconfirm > /dev/null 2>&1
    fi
    echo 30
    
    # 2. Backup and Prep
    mkdir -p "$HOME/.config"
    cp -r "$HOME/.config" "$BACKUP_DIR"
    mkdir -p "$TEMP_DIR"
    echo 50

    # 3. Download and Unpack
    # Assuming it's a git repo; change to curl/unzip if it's a zip
    git clone "$REPO_URL" "$TEMP_DIR" > /dev/null 2>&1
    echo 70

    # 4. Move selected folders
    for folder in "swaylock" "zathura" "waybar" "rofi" "niri" "mako" "fish" "fastfetch" "alacritty"; do
        if [[ $CHOICES == *"$folder"* ]]; then
            # Assuming files are inside a .config folder in your repo
            cp -r "$TEMP_DIR/.config/$folder" "$HOME/.config/"
        fi
    done
    echo 100
} | whiptail --gauge "Cooking your system..." 6 60 0

# Finish & Cleanup
if whiptail --title "Done" --yesno "It's installed. Want to get rid of the residuals in Downloads?" 10 60; then
    rm -rf "$TEMP_DIR"
    echo "Residuals nuked."
else
    echo "Files kept in $TEMP_DIR."
fi

echo "All set. Backup is at $BACKUP_DIR"
