# Inherit common mobile Lineage stuff
$(call inherit-product, vendor/lineage/config/common.mk)

# Default notification/alarm sounds
PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.notification_sound=oneplus.ogg \
    ro.config.alarm_alert=into_the_night.ogg

ifeq ($(strip $(TARGET_BUILD_APERTURE_CAMERA)),true)
PRODUCT_PACKAGES += \
    Aperture

PRODUCT_PACKAGE_OVERLAYS += \
    vendor/lineage/overlay/aperture
endif

ifeq ($(strip $(TARGET_BUILD_GRAPHENE_CAMERA)),true)
PRODUCT_PACKAGES += \
    GrapheneCamera
    
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/lineage/overlay/graphene
endif

# Apps
PRODUCT_PACKAGES += \
    Backgrounds \
    Profiles

# Seedvault
TARGET_EXCLUDES_SEEDVAULT ?=true
ifneq ($(TARGET_EXCLUDES_SEEDVAULT),true)
PRODUCT_PACKAGES += \
    Seedvault \
    OverlaySettingsProvider
endif

TARGET_EXCLUDES_AUDIOFX ?=true
ifneq ($(TARGET_EXCLUDES_AUDIOFX),true)
PRODUCT_PACKAGES += \
    AudioFX
endif

ifeq ($(PRODUCT_TYPE), go)
PRODUCT_PACKAGES += \
    Launcher3QuickStepGo

PRODUCT_DEXPREOPT_SPEED_APPS += \
    Launcher3QuickStepGo
else
PRODUCT_PACKAGES += \
    Launcher3QuickStep

PRODUCT_DEXPREOPT_SPEED_APPS += \
    Launcher3QuickStep
endif

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

ifneq ($(WITH_LINEAGE_CHARGER),false)
PRODUCT_PACKAGES += \
    lineage_charger_animation \
    lineage_charger_animation_vendor
endif

# Customizations
PRODUCT_PACKAGES += \
    NavigationBarMode2ButtonOverlay

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

# SystemUI plugins
PRODUCT_PACKAGES += \
    QuickAccessWallet

# Themes
PRODUCT_PACKAGES += \
    LineageBlackTheme \
    ThemePicker
