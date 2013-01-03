# use AOSP default sounds
PRODUCT_PROPERTY_OVERRIDES += \
  ro.config.ringtone=Themos.ogg \
  ro.config.notification_sound=Proxima.ogg \
  ro.config.alarm_alert=Cesium.ogg

# Copy specific ROM files
PRODUCT_COPY_FILES += \
    vendor/kb/prebuilt/common/apk/NovaLauncher.apk:system/app/NovaLauncher.apk \
    vendor/kb/prebuilt/common/apk/TitaniumBackup.apk:system/app/TitaniumBackup.apk \
    vendor/kb/prebuilt/common/apk/SuperSU.apk:system/app/SuperSU.apk \
    vendor/kb/prebuilt/common/xbin/su:system/xbin/su

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/kb/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/kb/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/kb/prebuilt/common/bin/50-backupScript.sh:system/addon.d/50-backupScript.sh

### AOKP ###
# AOKP Packages
PRODUCT_PACKAGES += \
    ROMControl

# AOKP Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/kb/overlay/aokp/common

### OTA ###
# OTA.. Packages
PRODUCT_PACKAGES += \
    OTAUpdateCenter

### PARANOID ###
# ParanoidAndroid Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/pa/overlay/common
PRODUCT_PACKAGE_OVERLAYS += vendor/pa/overlay/$(TARGET_PRODUCT)

# Allow device family to add overlays and use a same prop.conf
ifneq ($(OVERLAY_TARGET),)
    PRODUCT_PACKAGE_OVERLAYS += vendor/pa/overlay/$(OVERLAY_TARGET)
    PA_CONF_SOURCE := $(OVERLAY_TARGET)
else
    PA_CONF_SOURCE := $(TARGET_PRODUCT)
endif

# ParanoidAndroid Proprietary
PRODUCT_COPY_FILES += \
    vendor/pa/prebuilt/$(PA_CONF_SOURCE).conf:system/etc/paranoid/properties.conf \
    vendor/pa/prebuilt/$(PA_CONF_SOURCE).conf:system/etc/paranoid/backup.conf

### PAC ###
# Common Proprietary
#PRODUCT_COPY_FILES += \
#    vendor/pac/prebuilt/common/app/FileManager.apk:system/app/FileManager.apk

BOARD := $(subst kb_,,$(TARGET_PRODUCT))

# Add CM release version
CM_RELEASE := true
CM_BUILD := $(BOARD)

PA_VERSION_MAJOR = 2
PA_VERSION_MINOR = 9
PA_VERSION_MAINTENANCE = 9

TARGET_CUSTOM_RELEASETOOL := vendor/kb/tools/squisher

VERSION := $(PA_VERSION_MAJOR).$(PA_VERSION_MINOR)$(PA_VERSION_MAINTENANCE)
PA_VERSION := pa_$(BOARD)-$(VERSION)-$(shell date +%0d%^b%Y-%H%M%S)

KB_VERSION_MAJOR = 1
KB_VERSION_MINOR = 3
KB_VERSION_MAINTENANCE = 0
KB_VERSION := $(KB_VERSION_MAJOR).$(KB_VERSION_MINOR).$(KB_VERSION_MAINTENANCE)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.kb.version=$(KB_VERSION) \
    ro.kbrom.version=$(BOARD)_KINGBEATZ_JB_ALPHA-v$(KB_VERSION) \
    ro.modversion=$(PA_VERSION) \
    ro.pa.family=$(PA_CONF_SOURCE) \
    ro.pa.version=$(VERSION) \
    ro.aokp.version=$(BOARD)_jb-Milestone-1 \
    otaupdater.otaid=KingBeaTz \
    otaupdater.otaver=$(KB_VERSION) \
    otaupdater.otatime=$(shell date +%Y%m%d-%H%m) 
