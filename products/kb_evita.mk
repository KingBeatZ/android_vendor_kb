# Check for target product
ifeq (kb_evita,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_xhdpi

# AOKP device overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/kb/overlay/aokp/device/evita

# PAC device overlay
$(shell cp -f vendor/kb/overlay/kb/htc/xhdpi/frameworks/base/core/res/assets/images/android-logo-mask.png frameworks/base/core/res/assets/images/android-logo-mask.png)

# PA settings overlay
#$(shell cp -f vendor/pac/prebuilt/pa_xhdpi.conf vendor/pa/prebuilt/pa_xhdpi.conf)

# PAC boot logo
#PRODUCT_COPY_FILES += \
#    vendor/kb/prebuilt/common/bootlogo/pac_logo_720x1280.rle:root/logo.rle

# include ParanoidAndroid common configuration 

include vendor/kb/config/kb_common.mk

# Inherit CM device configuration
$(call inherit-product, device/htc/evita/cm.mk)

PRODUCT_NAME := kb_evita

endif
