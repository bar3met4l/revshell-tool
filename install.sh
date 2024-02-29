#!/bin/bash

# Install script for the revshell tool

# Choose the installation directory
install_dir="/usr/local/bin"
tool_name="revshell"
# Copy the script to the installation directory
sudo cp reverseshell.sh "$install_dir"/revshell
sudo chmod +x "$install_dir"/"$tool_name"
sudo cp revshell.png /usr/share/icons/
desktop_entry="[Desktop Entry]\nVersion=1.0\nType=Application\nName=RevShell\nExec=$tool_name\nIcon=/usr/share/icons/revshell.png\nCategories=Utility\nTerminal=true"
echo -e "$desktop_entry" | sudo tee "/usr/share/applications/$tool_name.desktop" > /dev/null
sudo update-desktop-database

# Inform the user
echo "revshell installed successfully. You can now run it with the command 'revshell'."
