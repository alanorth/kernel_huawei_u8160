#!/bin/bash

function setenv {
	echo -n "Setting ARM environment..."
	export ARCH=arm
	export CROSS_COMPILE="ccache /home/aorth/android/CM7/prebuilt/linux-x86/toolchain/arm-eabi-4.4.3/bin/arm-eabi-"
	export CFLAGS="-Os -floop-interchange -floop-strip-mine -fomit-frame-pointer -floop-block -mfpu=vfp -pipe -march=armv6j"
	echo " done."

	echo -n "Setting other environment variables..."
	# the number of CPUs to use when compiling the kernel (auto detect all available)
	export CPUS=`grep -c processor /proc/cpuinfo`
	echo " done."
}

setenv
schedtool -B -n19 -e make -j${CPUS}
