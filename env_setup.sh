#!/bin/bash

## Colorize and add text parameters

export red=$(tput setaf 1)             #  red
export grn=$(tput setaf 2)             #  green
export blu=$(tput setaf 4)             #  blue
export cya=$(tput setaf 6)             #  cyan
export txtbld=$(tput bold)             #  Bold
export bldred=${txtbld}$(tput setaf 1) #  red
export bldgrn=${txtbld}$(tput setaf 2) #  green
export bldblu=${txtbld}$(tput setaf 4) #  blue
export bldcya=${txtbld}$(tput setaf 6) #  cyan
export txtrst=$(tput sgr0)             #  Reset

##TEST
# Set Target
TARGET=${1}

##SET VARIABLES
export ARCH=arm;
export SUB_ARCH=arm;
#export CROSS_COMPILE=/home/gazm/toolchains/gcc-linaro-4.9-arm-linux-gnueabi/bin/arm-linux-gnueabi-;
#export CROSS_COMPILE=/home/gazm/toolchains/UBERTC-6.0-arm-eabi/bin/arm-eabi-;
export CROSS_COMPILE=/home/gazm/toolchains/UBERTC-4.9-arm-eabi/bin/arm-eabi-;
export DEFCONFIG=crispy_defconfig;
export EXTRA_CMDS='';
export KERNEL_DIR=/home/gazm/CrispyKernel;
export NUMBEROFCPUS=`grep 'processor' /proc/cpuinfo | wc -l`;
export USER=`whoami`;
export KBUILD_BUILD_USER="GAZM";
export KBUILD_BUILD_HOST="CrispyKernel";
export ANYKERNEL_DIR=/home/gazm/AnyKernel2;
export EXP_CONFIG_DIR=/home/gazm/CrispyKernel/arch/arm/configs/ext_config/CRISPYCONFIGS/;

#TEST
#########################
# if [ ! -f ${CROSS_COMPILE}gcc ]; then
# 	echo "${bldred}Cannot find GCC compiler ${CROSS_COMPILE}gcc${txtrst}";
# 	echo "${bldcya}Please ensure you have GCC Compiler at path mentioned.${txtrst}";
# 	exit 1;
# fi;
