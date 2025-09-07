#!/bin/bash

BASHRC="$HOME/.bashrc"
VBOARD_ZIP=virtual.zip
#----------------------------------------
# Function : addToBashrc
# Purpose  : Add all aliases at the end of ~/.bashrc
#----------------------------------------
addToBashrc() {
    echo "[DEBUG] Running addToBashrc..."

    cat << 'EOF' >> "$BASHRC"

# >>> Custom QEMU aliases <<<
alias vb='cd $HOME/codes/virtual/bootloader/u-boot-2023.10 && qemu-system-arm -M vexpress-a9 -m 128M -nographic -kernel u-boot -sd ../../sdcard.img'

alias vboard='cd $HOME/codes/virtual/1_busybox && qemu-system-arm -M vexpress-a9 -kernel ../kernel/linux-6.6.11/arch/arm/boot/zImage -dtb ../kernel/linux-6.6.11/arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb -append "console=ttyAMA0 rdinit=/bin/sh" -nographic -initrd initramfs.cpio.gz'

alias vrootfs='cd $HOME/codes/virtual && qemu-system-arm -M vexpress-a9 -kernel kernel/linux-6.6.11/arch/arm/boot/zImage -dtb kernel/linux-6.6.11/arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb -append "console=ttyAMA0 root=/dev/mmcblk0 rw" -nographic -sd 1_busybox/rootfs.ext4'

alias vbt='export PATH=$PATH:$HOME/x-tools/arm-lwl-linux-uclibcgnueabihf/bin'

# <<< Custom QEMU aliases <<<
EOF

    echo "[DEBUG] Aliases added to $BASHRC"
    echo "[DEBUG] Run 'source $BASHRC' or restart terminal to apply."
}

#----------------------------------------
# Function : setup
# Purpose  : Placeholder (empty for now)
#----------------------------------------
setup() {
# Create the target directory
	mkdir -p "$HOME/codes/virtual"
	mkdir -p "$HOME/x-tools"

	# Unzip the file (assumes $VBOARD_ZIP is set and points to a valid .zip file)
	unzip "$VBOARD_ZIP"

	# Move main files and folders (excluding x-tools) to $HOME/codes/virtual
	cd virtual && mv 1_busybox bootloader crosstool-ng initramfs kernel temp "$HOME/codes/virtual/"

	# Move x-tools to $HOME/x-tools
	mv x-tools "$HOME/x-tools"

	echo "Run [ vboard | vrootfs ] "   
}

#----------------------------------------
# Main
#----------------------------------------
addToBashrc
setup

