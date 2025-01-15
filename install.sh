#!/bin/bash

# Copy necessary files to system locations
echo "Installing GPU reset service..."

# Copy the script to /usr/local/bin
sudo cp usr/local/bin/gpu-reset.sh /usr/local/bin/
# Copy the systemd service to /etc/systemd/system
sudo cp etc/systemd/system/gpu-reset.service /etc/systemd/system/

# Set executable permissions for the script
sudo chmod +x /usr/local/bin/gpu-reset.sh

# Reload systemd and enable the service
sudo systemctl daemon-reload
sudo systemctl enable gpu-reset.service

echo "Installation complete! The GPU reset service is now enabled."
