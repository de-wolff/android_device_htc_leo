# Copyright (C) 2009 The Android Open Source Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := false

# inherit common defines for all qsd8k devices
include device/htc/qsd8k-common/BoardConfigCommon.mk
include vendor/htc/leo/BoardConfigVendor.mk
																																																																													
TARGET_BOOTLOADER_BOARD_NAME := htcleo
TARGET_ARCH_VARIANT_CPU := cortex-a8
TARGET_ARCH_VARIANT_FPU := neon
TARGET_NO_BOOTLOADER := true

# Define kernel config for inline building
TARGET_PREBUILT_KERNEL := device/htc/leo/prebuilt/kernel
TARGET_KERNEL_SOURCE := kernel/htc/leo
TARGET_KERNEL_CONFIG := htcleo_defconfig
# undo setting in qsd8k
KERNEL_TOOLCHAIN_PREFIX:=

# FPU compilation flags
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp

BOARD_KERNEL_CMDLINE := no_console_suspend=1 console=null
BOARD_KERNEL_BASE := 0x11800000
BOARD_KERNEL_NEW_PPPOX := true

# Legacy
TARGET_USES_MDP3 := true
TARGET_USES_PMEM := true

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
BOARD_HOSTAPD_DRIVER             := WEXT
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_wext
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WLAN_DEVICE           := bcm4329
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_FW_PATH_STA     := "/system/vendor/firmware/fw_bcm4329_abg.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/vendor/firmware/fw_bcm4329_apsta.bin"
WIFI_DRIVER_MODULE_ARG      := "iface_name=wlan0 firmware_path=/system/vendor/firmware/fw_bcm4329_abg.bin nvram_path=/proc/calibration"
WIFI_DRIVER_MODULE_NAME     := "bcm4329"

#WIFI_BAND := 802_11_ABG

# Hacks for legacy mdp drivers
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
BOARD_ADRENO_AVOID_EXTERNAL_TEXTURE := true

COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60

TARGET_CUSTOM_RELEASETOOL := device/htc/leo/releasetools/squisher

# # cat /proc/mtd
# dev:    size   erasesize  name
#mtd0: 00500000 00020000 "recovery"
#mtd1: 00100000 00020000 "misc"
#mtd2: 00500000 00020000 "boot"
#mtd3: 0fa00000 00020000 "system"
#mtd4: 00500000 00020000 "cache"
#mtd5: 0b320000 00020000 "userdata"

BOARD_BOOTIMAGE_PARTITION_SIZE     := 0x00500000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00500000
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 0x0fa00000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x0b320000
BOARD_FLASH_BLOCK_SIZE := 131072



# to enable the GPS HAL
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := leo
# AMSS version to use for GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 3200

# RIL
BOARD_USE_NEW_LIBRIL_HTC := true

# Hacks
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun0/file
BOARD_USE_LEGACY_TRACKPAD := true

# Recovery
TARGET_PREBUILT_RECOVERY_KERNEL := device/htc/leo/prebuilt/recovery_kernel

# TWRP
DEVICE_RESOLUTION := 480x800
TW_EXTERNAL_STORAGE_PATH := "/sdcard"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard"

#??
BOARD_USES_ADRENO_200 := true

ARCH_ARM_HAVE_VFP := true  #?????

# Scorpion optimizations
TARGET_USE_SCORPION_BIONIC_OPTIMIZATION := true
TARGET_USE_SCORPION_PLD_SET := true
TARGET_SCORPION_BIONIC_PLDOFFS := 6
TARGET_SCORPION_BIONIC_PLDSIZE := 128

TARGET_SPECIFIC_HEADER_PATH += device/htc/leo/include
# Common
TARGET_RELEASETOOLS_EXTENSIONS := device/htc/common

