#!/bin/bash

function error() {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

function warning() {
  echo -e "\\e[91m$1\\e[39m"
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

function install_portainer() {
    # Install Portainer if Docker is installed``
    if command -v docker &>/dev/null; then
        echo "Docker is installed, performing to install portainer"
		if dpkg -s portainer &> /dev/null; then
			echo "Portainer is installed. Removing old version..."
			
			# Remove Portainer
			portainer_pid=`docker ps | grep portainer-ce | awk '{print $1}'`
			portainer_name=`docker ps | grep portainer-ce | awk '{print $2}'`

			echo "Removing the old version of Portainer"
			sudo docker stop $portainer_pid || warning "Failed to stop portainer!"
			sudo docker rm $portainer_pid || warning "Failed to remove portainer container!"
			sudo docker rmi $portainer_name || warning "Failed to remove/untag images from the container!"

			echo "Pruning unused volume.  If asked answer yes."
			sudo docker volume prune
			
			echo "Old version of Portainer has been removed."
			echo now doing a fresh install of portainer
			sudo docker run -d -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest|| error "Failed to execute newer version of Portainer!"
		else
			echo "Portainer is not installed."
			echo "Installing Portainer..."
			sudo docker pull portainer/portainer-ce:latest
			sudo docker run -d -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest || error "Fai1ed to install portainer"
			echo "Portainer installed successfully"
		fi
    else
        echo "Docker is not installed. Please install Docker first."
    fi
}

# Check internet connection
check_internet_connection

# Install Docker if connected to the internet
if [ $? -eq 0 ]; then
	update_upgrade
    install_portainer
fi