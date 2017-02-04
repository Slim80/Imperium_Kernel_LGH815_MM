#!/bin/sh
export KERNELDIR=`readlink -f .`
export PARENT_DIR=`readlink -f ..`
export ARCH=arm64
export SUBARCH=arm64
export PATH=/home/slim80/Scrivania/Kernel/Compilatori/aarch64-linux-android-4.9/bin:$PATH
# export PATH=/home/slim80/Scrivania/Kernel/Compilatori/UBERTC-aarch64-linux-android-4.9-kernel/bin:$PATH
export CROSS_COMPILE=aarch64-linux-android-
export TARGET_PREBUILT_KERNEL=/home/slim80/Scrivania/Kernel/LG/Imperium/Imperium_Kernel_H815/arch/arm64/boot/Image.gz-dtb
export KCONFIG_NOTIMESTAMP=true

IMPERIUM="/home/slim80/Scrivania/Kernel/LG/Imperium"
KERNELDIR="/home/slim80/Scrivania/Kernel/LG/Imperium/Imperium_Kernel_H815"
BUILDEDKERNEL="/home/slim80/Scrivania/Kernel/LG/Imperium/Imperium_Kernel_H815/1_Imperium"
IMAGE="/home/slim80/Scrivania/Kernel/LG/Imperium/Imperium_Kernel_H815/arch/arm64/boot"

rm -f arch/arm64/boot/*.cmd
rm -f arch/arm64/boot/dts/*.cmd
rm -f arch/arm64/boot/Image*.*
rm -f arch/arm64/boot/.Image*.*
find -name '*.dtb' -exec rm -rf {} \;
find -name '*.ko' -exec rm -rf {} \;
rm -f $BUILDEDKERNEL/Builded_Kernel/boot.img
rm -f dt.img
rm -f $IMPERIUM/Imperium_ramdisk_H815.cpio.gz
rm -f $IMPERIUM/Imperium_ramdisk_H815_systemless.cpio.gz

make clean
make distclean
rm -rf ~/.ccache
ccache -C
