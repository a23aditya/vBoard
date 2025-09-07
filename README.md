# QEMU Virtual Board Setup Script

This project provides a Bash script to automate the setup of a QEMU-based ARM virtual environment using BusyBox, U-Boot, and a custom Linux kernel. It also adds helpful aliases to your `.bashrc` for quick access to your virtual boards.

---

## 📁 Files

- `virtual.sh`: Main setup script.
- `README.md`: Project documentation.
- `virtual.zip`: 📦 **Download separately** [from this link](https://drive.google.com/file/d/1xV7fOPRR83WfUI5amdFnpnZMziwQRW40/view?usp=drive_link)

---

## 🔽 Download `virtual.zip`

Due to GitHub’s file size limit, `virtual.zip` (1.1 GB) is **not included** in this repository.

👉 Download it from:  
📎 [**Download virtual.zip**](https://drive.google.com/file/d/1xV7fOPRR83WfUI5amdFnpnZMziwQRW40/view?usp=drive_link)

> After downloading, place `virtual.zip` in the **same folder** as `virtual.sh` before running the script.

---

## ⚙️ What the Script Does

1. **Adds Aliases to `.bashrc`:**
   - `vb`: Run U-Boot in QEMU
   - `vboard`: Boot BusyBox using initramfs
   - `vrootfs`: Boot rootfs from SD card image
   - `vbt`: Add cross-toolchain to `$PATH`

2. **Extracts and Moves Files:**
   - Unzips `virtual.zip`
   - Moves directories to `~/codes/virtual/`
   - Moves toolchain to `~/x-tools/`

3. **Prepares Environment** by creating required folders.

---

## 🚀 Getting Started

### 1. Prerequisites

Make sure the following packages are installed:

```bash
sudo apt update
sudo apt install qemu-system-arm 

