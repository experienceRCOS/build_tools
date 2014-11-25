#!/bin/bash

cd ..

COUNT=0
CURRENT_DIR="$PWD"
PATCHES=(
'frameworks/native			build_tools/patches/0001-Workaround-CAPRI_HWC-issues.patch'
'external/chromium_org		build_tools/patches/0002-web-browser-Disable-HW-rendering-for-S2Plus.patch'
'frameworks/av				build_tools/patches/0003-OMXCodec-Set-default-input-buffer-size-for-S2Plus.patch'
'hardware/broadcom/libbt	build_tools/patches/0004-Add-BT-Support-for-S2Plus.patch'
'vendor/cm					build_tools/patches/0005-Remove-useless-packages.patch'
'frameworks/base			build_tools/patches/0006-LED.patch'
)

while [ "x${PATCHES[COUNT]}" != "x" ]
do
	CURRENT="${PATCHES[COUNT]}"
    FOLDER=`echo "$CURRENT" | awk '{print $1}'`
	PATCH=`echo "$CURRENT" | awk '{print $2}'`

	cd "$FOLDER"
	echo Patching "$FOLDER" ...
	git apply "$CURRENT_DIR/$PATCH"
	cd "$CURRENT_DIR"

	COUNT=$(($COUNT + 1))
done
