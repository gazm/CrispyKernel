#!/bin/bash

echo "***** Setting up Environment *****";

. ./env_setup.sh || exit 1;

echo "${bldcya}***** Cleaning in Progress *****${txtrst}";

# clean major chunk
rm -rf $KERNEL_DIR/shamu >> /dev/null;

# clean up kernel compiled binaries
make mrproper;
make clean;

# clean up generated files

rm -f $KERNEL_DIR/arch/arm/boot/*.dtb >> /dev/null;
rm -f $KERNEL_DIR/arch/arm/boot/*.cmd >> /dev/null;
rm -f $KERNEL_DIR/arch/arm/boot/Image >> /dev/null;
rm -f $KERNEL_DIR/arch/arm/boot/Image.gz >> /dev/null;
rm -f $KERNEL_DIR/arch/arm/boot/Image.gz-dtb >> /dev/null;
rm -f $KERNEL_DIR/arch/arm/mach-msm/smd_rpc_sym.c >> /dev/null;
rm -f $KERNEL_DIR/arch/arm/crypto/aesbs-core.S >> /dev/null;
rm -f $KERNEL_DIR/r*.cpio >> /dev/null;
rm -f $KERNEL_DIR/ramdisk* >> /dev/null;
rm -rf $KERNEL_DIR/include/generated >> /dev/null;
rm -rf $KERNEL_DIR/arch/*/include/generated >> /dev/null;
rm -f $KERNEL_DIR/Image.gz >> /dev/null;
rm -f $KERNEL_DIR/Image >> /dev/null;
rm -f $KERNEL_DIR/out/Image.gz >> /dev/null;
rm -f $KERNEL_DIR/Image.gz-dtb >> /dev/null;
rm -f $KERNEL_DIR/out/*.img >> /dev/null;
rm -rf $KERNEL_DIR/out/boot >> /dev/null;
rm -f $KERNEL_DIR/*.img >> /dev/null;
rm -f $KERNEL_DIR/dt.img >> /dev/null;
rm -rf $KERNEL_DIR/out/system/lib/modules >> /dev/null;
rm -rf $KERNEL_DIR/out/tmp_modules >> /dev/null;
rm -f $KERNEL_DIR/out/*.zip >> /dev/null;
rm -rf $KERNEL_DIR/tmp >> /dev/null;

# clean up leftover junk
find . -not -path '*/\.*' -type f \( -iname \*.rej \
				-o -iname \*.orig \
				-o -iname \*.bkp \
				-o -iname \*.ko \
				-o -iname \*.c.BACKUP.[0-9]*.c \
				-o -iname \*.c.BASE.[0-9]*.c \
				-o -iname \*.c.LOCAL.[0-9]*.c \
				-o -iname \*.c.REMOTE.[0-9]*.c \
				-o -iname \*.org \) \
					| parallel rm -fv {};

echo "${bldcya}***** Cleaning Done *****${txtrst}";
