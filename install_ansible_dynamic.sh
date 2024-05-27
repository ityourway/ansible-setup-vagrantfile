#!/bin/bash

# Function to install Ansible on Ubuntu
install_ansible_ubuntu() {
    echo "Detected Ubuntu. Installing Ansible..."
    sudo apt update
    sudo apt install -y software-properties-common
    sudo add-apt-repository --yes --update ppa:ansible/ansible
    sudo apt install -y ansible
}

# Function to install Ansible on CentOS
install_ansible_centos() {
    echo "Detected CentOS. Installing Ansible..."
    sudo yum install -y epel-release
    sudo yum install -y ansible
}

# Detect the OS type
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
else
    echo "Cannot determine the OS type."
    exit 1
fi

# Install Ansible based on the detected OS
case $OS in
    ubuntu)
        install_ansible_ubuntu
        ;;
    centos)
        install_ansible_centos
        ;;
    *)
        echo "Unsupported OS: $OS"
        exit 1
        ;;
esac

# Verify the installation
if command -v ansible >/dev/null 2>&1; then
    echo "Ansible installation was successful."
    ansible --version
else
    echo "Ansible installation failed."
    exit 1
fi
