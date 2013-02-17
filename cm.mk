# Inherit AOSP device configuration for leo.
$(call inherit-product, device/htc/leo/full_leo.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Include GSM stuff
$(call inherit-product, vendor/cm/config/gsm.mk)


## Device identifier. This must come after all inclusions
PRODUCT_MODEL := HD2
PRODUCT_MANUFACTURER := HTC
PRODUCT_BRAND := htc
PRODUCT_DEVICE := leo
PRODUCT_NAME := cm_leo
PRODUCT_CODENAME := leo

# Set build fingerprint / ID / Prduct Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=leo BUILD_ID=JW172F BUILD_DISPLAY_ID=JW172F BUILD_FINGERPRINT="google/htc_leo/leo:4.2.1/JW172F/485486:user/release-keys" PRIVATE_BUILD_DESC="full_leo-user 4.2.1 JW172F 485486 release-keys"

