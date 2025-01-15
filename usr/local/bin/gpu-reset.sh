#!/bin/bash
LOGFILE="/var/log/gpu-reset.log"

echo "$(date): Starting GPU reset process..." >> "$LOGFILE"

# Check for the nvidia_uvm module
if lsmod | grep -q "^nvidia_uvm"; then
    echo "$(date): Unloading nvidia_uvm module..." >> "$LOGFILE"
    sudo rmmod nvidia_uvm
else
    echo "$(date): nvidia_uvm module not loaded, skipping unload." >> "$LOGFILE"
fi

# Reload the module regardless
echo "$(date): Reloading nvidia_uvm module..." >> "$LOGFILE"
sudo modprobe nvidia_uvm

echo "$(date): GPU reset completed." >> "$LOGFILE"
