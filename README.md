# GPU Reset Service

This repository contains a systemd service and script to automatically reset the NVIDIA GPU modules after the system wakes from sleep. It handles unloading and reloading the `nvidia_uvm` module, ensuring stable GPU functionality. This is primarily helpful when encountering errors after resuming from sleep.

## Installation

To easily install and set up the GPU reset service, use the provided installation script.

### Steps

1. **Clone the Repository**
   ```bash
   git clone <repo-url>
   cd gpu-reset-service

2. Run the Installation Script This will automatically copy the necessary files to their appropriate system locations and enable the service.

       sudo ./install.sh

3. Verify the Installation

  After installation, the GPU reset service will be active. You can verify its status and view logs:

      sudo systemctl status gpu-reset.service
      cat /var/log/gpu-reset.log

4.Usage

  Suspend the system

      sudo systemctl suspend

  Verify Logs Check the logs after the system wakes up:

      cat /var/log/gpu-reset.log

5. Why

  When a system with an NVIDIA GPU resumes from sleep, some applications like PyTorch may encounter errors when initializing the GPU (e.g., CUDA initialization: CUDA unknown error). This happens because the GPU environment isn't properly reset after resuming from sleep. The reset service ensures that necessary modules like nvidia_uvm are unloaded and reloaded, avoiding these errors.

  This issue and solution were pointed out by ptrblck in [this PyTorch forum post](https://discuss.pytorch.org/t/userwarning-cuda-initialization-cuda-unknown-error-this-may-be-due-to-an-incorrectly-set-up-environment-e-g-changing-env-variable-cuda-visible-devices-after-program-start-setting-the-available-devices-to-be-zero/129335/13). This implementation is meant to automate those steps.

7. Debugging

  Ensure your user has sudo permissions to run rmmod and modprobe.
  Check logs for any issues:

    sudo journalctl -u gpu-reset.service
