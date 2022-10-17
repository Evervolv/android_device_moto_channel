#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
        # Use VNDK 32 libutils
        vendor/lib/hw/audio.primary.sdm632.so | vendor/lib/libmotaudioutils.so | vendor/lib/libsensorndkbridge.so | vendor/lib/libtinycompress_vendor.so)
            "${PATCHELF}" --replace-needed "libutils.so" "libutils-v32.so" "${2}"
            ;;
        vendor/lib/soundfx/libspeakerbundle.so | vendor/lib/soundfx/libmmieffectswrapper.so)
            "${PATCHELF}" --replace-needed "libutils.so" "libutils-v32.so" "${2}"
            ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=channel
export DEVICE_COMMON=sdm632-common
export VENDOR=moto

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
