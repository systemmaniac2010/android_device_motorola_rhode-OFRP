#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2021-2026 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#
FDEVICE="rhode"

fox_get_target_device() {
  if echo "$BASH_SOURCE" | grep -q "/$FDEVICE/"; then
      FOX_BUILD_DEVICE="$FDEVICE";
  elif set | grep BASH_ARGV | grep -w \"$FDEVICE\"; then
      FOX_BUILD_DEVICE="$FDEVICE";
  elif echo "${BASH_SOURCE[0]}" | grep -q "/$FDEVICE/"; then
      FOX_BUILD_DEVICE="$FDEVICE";
  elif echo "$0" | grep -q "$FDEVICE"; then
      FOX_BUILD_DEVICE="$FDEVICE";
  fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
	export LC_ALL="C.UTF-8"
 	export ALLOW_MISSING_DEPENDENCIES=true
	export FOX_MAINTAINER_PATCH_VERSION=1
	export OF_MAINTAINER="Shreevatsavan D"
	export FOX_VANILLA_BUILD=1
	export FOX_AB_DEVICE=1
	export CCACHE_EXEC=/usr/bin/ccache
	ccache -M 50G
	export FOX_ENABLE_KERNELSU_SUPPORT=1
	export FOX_ENABLE_KERNELSU_NEXT_SUPPORT=1
	export FOX_ENABLE_SUKISU_SUPPORT=1
	export OF_ENABLE_FRP_ADDON=1
	export FOX_USE_BASH_SHELL=1
	export FOX_ASH_IS_BASH=1
	export OF_SCREEN_H=20:9
	export FOX_USE_NANO_EDITOR=1
	export OF_ENABLE_ALL_PARTITION_TOOLS=1
	export OF_DEFAULT_KEYMASTER_VERSION=4.1
	export FOX_VANILLA_BUILD=1

	# add the MiSans fonts for propery display of Chinese characters
	export FOX_USE_MISANS_FONTS=1
else
	if [ -z "$FOX_BUILD_DEVICE" -a -z "$BASH_SOURCE" ]; then
		echo "I: This script requires bash. Not processing the $FDEVICE $(basename $0)"
	fi
fi
#
