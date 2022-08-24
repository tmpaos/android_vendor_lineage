# Copyright (C) 2021 AxiomOS
# base on Lineage and Voltage
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

ANDROID_VERSION := 13.0
AXIOMOSVERSION := 1.0

AXIOMOS_BUILD_TYPE ?= UNOFFICIAL
AXIOMOS_DATE_YEAR := $(shell date -u +%Y)
AXIOMOS_DATE_MONTH := $(shell date -u +%m)
AXIOMOS_DATE_DAY := $(shell date -u +%d)
AXIOMOS_DATE_HOUR := $(shell date -u +%H)
AXIOMOS_DATE_MINUTE := $(shell date -u +%M)
AXIOMOS_BUILD_DATE_UTC := $(shell date -d '$(AXIOMOS_DATE_YEAR)-$(AXIOMOS_DATE_MONTH)-$(AXIOMOS_DATE_DAY) $(AXIOMOS_DATE_HOUR):$(AXIOMOS_DATE_MINUTE) UTC' +%s)
AXIOMOS_BUILD_DATE := $(AXIOMOS_DATE_YEAR)$(AXIOMOS_DATE_MONTH)$(AXIOMOS_DATE_DAY)-$(AXIOMOS_DATE_HOUR)$(AXIOMOS_DATE_MINUTE)
TARGET_PRODUCT_SHORT := $(subst axiomos_,,$(AXIOMOS_BUILD))

# OFFICIAL_DEVICES
ifeq ($(AXIOMOS_BUILD_TYPE), OFFICIAL)
  LIST = $(shell cat vendor/axiomos/axiomos.devices)
    ifeq ($(filter $(AXIOMOS_BUILD), $(LIST)), $(AXIOMOS_BUILD))
      IS_OFFICIAL=true
      AXIOMOS_BUILD_TYPE := OFFICIAL
    endif
    ifneq ($(IS_OFFICIAL), true)
      AXIOMOS_BUILD_TYPE := UNOFFICIAL
      $(error Device is not official "$(AXIOMOS_BUILD)")
    endif
endif

AXIOMOS_VERSION := $(AXIOMOSVERSION)-$(AXIOMOS_BUILD)-$(AXIOMOS_BUILD_DATE)-$(AXIOMOS_BUILD_TYPE)

AXIOMOS_MOD_VERSION :=$(ANDROID_VERSION)-$(AXIOMOSVERSION)

AXIOMOS_DISPLAY_VERSION := AxiomOS-$(AXIOMOSVERSION)-$(AXIOMOS_BUILD_TYPE)

AXIOMOS_DISPLAY_BUILDTYPE := $(AXIOMOS_BUILD_TYPE)

AXIOMOS_FINGERPRINT := AxiomOS/$(AXIOMOS_MOD_VERSION)/$(TARGET_PRODUCT_SHORT)/$(shell date -u +%H%M)
