# Copyright (C) 2015 The CyanogenMod Project
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

# Define LOCAL_PATH
LOCAL_PATH := device/xiaomi/cancro

# Device overlays
DEVICE_PACKAGE_OVERLAYS += device/xiaomi/cancro/overlay

# Device has no sdcard
PRODUCT_CHARACTERISTICS := nosdcard

# TWRP fstab
ifeq ($(RECOVERY_VARIANT),twrp)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/etc/twrp.fstab:recovery/root/etc/twrp.fstab
endif

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=480

# adb unsecure for userdebug builds
ifeq ($(TARGET_BUILD_VARIANT),userdebug)
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0
endif

# Set io scheduler
PRODUCT_PROPERTY_OVERRIDES += \
    sys.io.scheduler=bfq

# Quick charge 2.0
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.usb.hvdcp.detect=true

# Art
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-swap=false

# Charger
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/root/chargeonlymode:root/sbin/chargeonlymode

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.rc \
    init.target.rc \
    init.qcom.usb.rc \
    ueventd.qcom.rc \
    init.class_main.sh \
    init.mdm.sh \
    init.qcom.class_core.sh \
    init.qcom.early_boot.sh \
    init.qcom.factory.sh \
    init.qcom.sh \
    init.qcom.ssr.sh \
    init.qcom.syspart_fixup.sh \
    init.qcom.usb.sh

# QCOM config script
PRODUCT_PACKAGES += \
    hsic.control.bt.sh \
    init.qcom.bt.sh \
    init.qcom.fm.sh \
    init.qcom.modem_links.sh \
    init.qcom.post_boot.sh \
    init.qcom.wifi.sh \
    qca6234-service.sh \
    usf_post_boot.sh

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gps/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/gps/flp.conf:system/etc/flp.conf \
    $(LOCAL_PATH)/gps/izat.conf:system/etc/izat.conf \
    $(LOCAL_PATH)/gps/quipc.conf:system/etc/quipc.conf \
    $(LOCAL_PATH)/gps/sap.conf:system/etc/sap.conf

PRODUCT_PROPERTY_OVERRIDES += \
    ro.gps.agps_provider=1

# Camera
PRODUCT_PACKAGES += \
    camera.msm8974 \
    libxml2

# Camera api
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1

# Radio
PRODUCT_PACKAGES += \
    libcnefeatureconfig

# Lights
PRODUCT_PACKAGES += \
    lights.msm8974

# Power
PRODUCT_PACKAGES += \
    power.msm8974

PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.perf.cores_online=1

# WiFi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv_x4.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv_x4.bin \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv_x4lte.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv_x4lte.bin \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv_x5.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv_x5.bin

PRODUCT_PACKAGES += \
    dhcpcd.conf \
    libwpa_client \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf \
    wpa_supplicant_overlay.conf \
    p2p_supplicant_overlay.conf \
    hostapd_default.conf \
    hostapd.accept \
    hostapd.deny

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \
    ro.use_data_netmgrd=true \
    persist.data.netmgrd.qos.enable=true \
    persist.data.tcpackprio.enable=true \
    ro.data.large_tcp_window_size=true \
    persist.cne.feature=0

# SoftAP
PRODUCT_PACKAGES += \
    libqsap_sdk \
    libQWiFiSoftApCfg \
    libwcnss_qmi \
    wcnss_service

# IPC router config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:system/etc/sec_config \
    $(LOCAL_PATH)/configs/lowi.conf:system/etc/lowi.conf

# NFC
PRODUCT_PACKAGES += \
    nfc_nci.bcm2079x.default \
    NfcNci \
    Tag

ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := $(LOCAL_PATH)/nfc/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := $(LOCAL_PATH)/nfc/nfcee_access_debug.xml
endif

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    $(LOCAL_PATH)/nfc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    $(LOCAL_PATH)/nfc/libnfc-brcm-20791b05.conf:system/etc/libnfc-brcm-20791b05.conf \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml

# NFC remover script for Mi4
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/nfc/removenfc.sh:install/bin/removenfc.sh

# Thermal config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal-engine-8974.conf:system/etc/thermal-engine-8974.conf

# Proprietery Firmware
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/android_model_facea.dat:system/etc/android_model_facea.dat \
    $(LOCAL_PATH)/rootdir/etc/android_model_faceg.dat:system/etc/android_model_faceg.dat \
    $(LOCAL_PATH)/rootdir/etc/sdm_200_HOG3x3_Grid3x3_bin5_noproj_zero_reduced.bin:system/etc/sdm_200_HOG3x3_Grid3x3_bin5_noproj_zero_reduced.bin \
    $(LOCAL_PATH)/rootdir/etc/sdm_200_HOG3x3_Grid3x3_bin5_noproj_zero_reduced.bin.pca:system/etc/sdm_200_HOG3x3_Grid3x3_bin5_noproj_zero_reduced.bin.pca \
    $(LOCAL_PATH)/rootdir/etc/xtwifi.conf:system/etc/xtwifi.conf \
    $(LOCAL_PATH)/rootdir/etc/calib.cfg:system/etc/calib.cfg \
    $(LOCAL_PATH)/rootdir/etc/modem/Diag.cfg:system/etc/modem/Diag.cfg

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/audio_effects.conf:system/etc/audio_effects.conf \
    $(LOCAL_PATH)/audio/init.qcom.audio.sh:system/etc/init.qcom.audio.sh \
    $(LOCAL_PATH)/audio/listen_platform_info.xml:system/etc/listen_platform_info.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:system/etc/mixer_paths.xml \
    $(LOCAL_PATH)/audio/acdb/MTP/MTP_Bluetooth_cal.acdb:system/etc/acdbdata/MTP/MTP_Bluetooth_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP/MTP_General_cal.acdb:system/etc/acdbdata/MTP/MTP_General_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP/MTP_Global_cal.acdb:system/etc/acdbdata/MTP/MTP_Global_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP/MTP_Handset_cal.acdb:system/etc/acdbdata/MTP/MTP_Handset_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP/MTP_Hdmi_cal.acdb:system/etc/acdbdata/MTP/MTP_Hdmi_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP/MTP_Headset_cal.acdb:system/etc/acdbdata/MTP/MTP_Headset_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP/MTP_Speaker_cal.acdb:system/etc/acdbdata/MTP/MTP_Speaker_cal.acdb

PRODUCT_PACKAGES += \
    audiod \
    audio.a2dp.default \
    audio_policy.msm8974 \
    audio.primary.msm8974 \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    tinymix

PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.audio.ssr=false \
    ro.qc.sdk.audio.fluencetype=fluence \
    persist.audio.fluence.voicecall=true \
    persist.audio.fluence.voicerec=true \
    persist.audio.fluence.speaker=false \
    audio.offload.video=false \
    use.voice.path.for.pcm.voip=true

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libdivxdrmdecrypt \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw

PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.enable-player=true \
    media.stagefright.enable-http=true \
    media.stagefright.enable-aac=true \
    media.stagefright.enable-qcp=true \
    media.stagefright.enable-fma2dp=true \
    media.stagefright.enable-scan=true \
    mmp.enable.3g2=true \
    mm.enable.smoothstreaming=true \
    mm.enable.qcom_parser=37491

# Enable more sensors
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.sensors.qmd=true \
    ro.qualcomm.sensors.smd=true \
    ro.qualcomm.sensors.cmc=true \
    ro.qualcomm.sensors.vmd=true \
    ro.qualcomm.sensors.gtap=true \
    ro.qualcomm.sensors.pedometer=true \
    ro.qualcomm.sensors.pam=true \
    ro.qualcomm.sensors.scrn_ortn=true \
    ro.qualcomm.sensors.georv=true \
    ro.qualcomm.sensors.game_rv=true \
    ro.qc.sensors.step_detector=true \
    ro.qc.sensors.step_counter=true \
    ro.qc.sensors.max_geomag_rotvec=true \
    ro.qc.sdk.sensors.gestures=true \
    ro.qc.sdk.gestures.camera=false \
    ro.qc.sdk.camera.facialproc=false \
    debug.qualcomm.sns.hal=w \
    debug.qualcomm.sns.daemon=w \
    debug.qualcomm.sns.libsensor1=w

# System property for cabl
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.cabl=0 \
    ro.qcom.ad=1 \
    ro.qcom.ad.calib.data=/system/etc/calib.cfg

# VIDC: debug_levels
# 1:ERROR 2:HIGH 4:LOW 0:NOLOGS 7:AllLOGS
PRODUCT_PROPERTY_OVERRIDES += \
    vidc.debug.level=1

# Filesystem management tools
PRODUCT_PACKAGES += \
    resize2fs_static

# Graphics
PRODUCT_PACKAGES += \
    copybit.msm8974 \
    gralloc.msm8974 \
    hwcomposer.msm8974 \
    memtrack.msm8974 \
    liboverlay

# power down SIM card when modem is sent to Low Power Mode.
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.apm_sim_not_pwdn=0

# Data
PRODUCT_PACKAGES += \
    librmnetctl \
    rmnetcli

# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8974

# FM radio
PRODUCT_PACKAGES += \
    FMRadio \
    libfmjni

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Misc. dependency packages
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes \
    curl \
    libnl_2 \
    libbson

# ANT+
PRODUCT_PACKAGES += \
    AntHalService \
    com.dsi.ant.antradio_library \
    libantradio

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    qcom.bt.dev_power_class=1 \
    bluetooth.hfp.client=1 \
    ro.bluetooth.alwaysbleon=true \
    qcom.bt.dev_power_class=1

# Misc. system properties
PRODUCT_PROPERTY_OVERRIDES += \
    persist.hwc.mdpcomp.enable=true \
    persist.timed.enable=true \
    ro.opengles.version=196608 \
    telephony.lteOnGsmDevice=1 \
    ro.vendor.extension_library=libqti-perfd-client.so \
    ro.telephony.call_ring.multiple=0 \
    ro.telephony.default_network=9

# Enable Adaptive Multi-Rate Wideband
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.enable.amr.wideband=1

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/atmel-maxtouch.kl:system/usr/keylayout/atmel-maxtouch.kl \
    $(LOCAL_PATH)/keylayout/cyttsp_button.kl:system/usr/keylayout/cyttsp_button.kl \
    $(LOCAL_PATH)/keylayout/fts.kl:system/usr/keylayout/fts.kl \
    $(LOCAL_PATH)/keylayout/msm8974-taiko-mtp-snd-card_Button_Jack.kl:system/usr/keylayout/msm8974-taiko-mtp-snd-card_Button_Jack.kl \
    $(LOCAL_PATH)/keylayout/synaptics_dsx.kl:system/usr/keylayout/synaptics_dsx.kl \
    $(LOCAL_PATH)/keylayout/synaptics_rmi4_i2c.kl:system/usr/keylayout/synaptics_rmi4_i2c.kl

# Permissions
PRODUCT_COPY_FILES += \
    external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:system/etc/permissions/com.dsi.ant.antradio_library.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.print.xml:system/etc/permissions/android.software.print.xml
