#
# Copyright (C) 2019 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from motorola sdm632-common
-include device/moto/sdm632-common/BoardConfigCommon.mk

DEVICE_PATH := device/moto/channel

# Assertions
TARGET_BOARD_INFO_FILE := device/moto/channel/board-info.txt
TARGET_OTA_ASSERT_DEVICE := channel

# Init
SOONG_CONFIG_NAMESPACES += MOTOROLA_SDM632_INIT
SOONG_CONFIG_MOTOROLA_SDM632_INIT := DEVICE_LIB
SOONG_CONFIG_MOTOROLA_SDM632_INIT_DEVICE_LIB := //$(DEVICE_PATH):libinit_channel

# Display
TARGET_SCREEN_DENSITY := 320

# Kernel
TARGET_KERNEL_CONFIG := channel_defconfig
BOARD_RAMDISK_USE_XZ := true

# Low Memory Devices
MALLOC_SVELTE := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432        #    32768 * 1024 mmcblk0p41-42
BOARD_MOTO_DYNAMIC_PARTITIONS_SIZE := 3082813440
BOARD_SUPER_PARTITION_SIZE := 3087007744
BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE := 2466250752    #  2408448 * 1024 mmcblk0p62-63
BOARD_SUPER_PARTITION_VENDOR_DEVICE_SIZE := 335544320     #   327680 * 1024 mmcblk0p60-61
BOARD_SUPER_PARTITION_ODM_DEVICE_SIZE     := 285212672         #   278528 * 1024 mmcblk0p60-61


# Reserve space for gapps install
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := -1
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 175000000
BOARD_VENDORIMAGE_EXTFS_INODE_COUNT := -1
BOARD_VENDORIMAGE_PARTITION_RESERVED_SIZE := 100000000


# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Sepolicy
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

# inherit from the proprietary version
include vendor/moto/channel/BoardConfigVendor.mk
