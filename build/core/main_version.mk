BUILD_NUMBER_CUSTOM := $(shell date -u +%H%M)

BUILD_SIGNATURE_KEYS := release-keys

BUILD_FINGERPRINT := $(PRODUCT_BRAND)/$(TARGET_DEVICE)/$(TARGET_DEVICE):$(PLATFORM_VERSION)/$(BUILD_ID)/$(BUILD_NUMBER_CUSTOM):$(TARGET_BUILD_VARIANT)/$(BUILD_SIGNATURE_KEYS)
ADDITIONAL_SYSTEM_PROPERTIES  += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)

# Voltageos System Version
ADDITIONAL_BUILD_PROPERTIES += \
  ro.axiomos.version=$(AXIOMOS_DISPLAY_VERSION) \
  ro.axiomos.build.status=$(AXIOMOS_BUILD_TYPE) \
  ro.modversion=$(AXIOMOS_MOD_VERSION) \
  ro.axiomos.build.date=$(BUILD_DATE) \
  ro.axiomos.buildtype=$(AXIOMOS_BUILD_TYPE) \
  ro.axiomos.fingerprint=$(AXIOMOS_FINGERPRINT) \
  ro.axiomos.device=$(AXIOMOS_BUILD) \
  org.axiomos.version=$(AXIOMOSVERSION)
