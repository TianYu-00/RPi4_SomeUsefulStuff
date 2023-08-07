#!/bin/bash

function error() {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

function check_internet_connection() {
    # Check internet connectivity by pinging a reliable host
	echo "Checking to see if you are connected to the internet"
    ping -c 1 google.com >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "Connected to the internet"
    else
        echo "Not connected to the internet"
    fi
}

function update_upgrade() {
    # Prompt the user if they would like to update and upgrade the Pi 4 OS 32-bit
    read -p "Would you like to perform update and upgrade before installing docker? (y/n): " choice

    # Check the user's choice
    case "$choice" in
        y|Y)
            # Update and upgrade the Pi 4 OS 32-bit
            sudo apt update && sudo apt upgrade -y
            ;;
        n|N)
            echo "No update and upgrade performed."
            ;;
        *)
            echo "Invalid choice. No update and upgrade performed."
            ;;
    esac
}


function install_docker() {
    # Install Docker if it is not already installed
    if ! command -v docker &>/dev/null; then
        echo "Installing Docker..."
        curl -sSL https://get.docker.com | sh || error "Failed to install Docker."
        sudo usermod -aG docker $USER || error "Failed to add user to the Docker usergroup."
        echo "Docker installed successfully"
		echo "Remember to reboot for the changes to take effect."
    else
        echo "Docker is already installed"
    fi
}

# Check internet connection
check_internet_connection

# Install Docker if connected to the internet
if [ $? -eq 0 ]; then
	update_upgrade
    install_docker
fi