# Inherit full common axiomos stuff
$(call inherit-product, vendor/axiomos/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include axiomos LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/axiomos/overlay/dictionaries
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/axiomos/overlay/dictionaries

# Enable support of one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode=true

$(call inherit-product, vendor/axiomos/config/telephony.mk)
