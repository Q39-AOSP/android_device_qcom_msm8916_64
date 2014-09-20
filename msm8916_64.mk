TARGET_USES_QCOM_BSP := true
# Add QC Video Enhancements flag
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# media_profiles and media_codecs xmls for 8916
ifeq ($(TARGET_ENABLE_QC_AV_ENHANCEMENTS), true)
PRODUCT_COPY_FILES += device/qcom/msm8916_32/media/media_profiles_8916.xml:system/etc/media_profiles.xml \
                      device/qcom/msm8916_32/media/media_codecs_8916.xml:system/etc/media_codecs.xml
endif

TARGET_USES_QCA_NFC := other

$(call inherit-product, device/qcom/common/common64.mk)

PRODUCT_NAME := msm8916_64
PRODUCT_DEVICE := msm8916_64
PRODUCT_BRAND := Android
PRODUCT_MODEL := MSM8916 for arm64

PRODUCT_BOOT_JARS += qcmediaplayer \
                     WfdCommon \
                     qcom.fmradio \
                     security-bridge \
                     qsb-port
PRODUCT_BOOT_JARS += vcard

# default is nosdcard, S/W button enabled in resource
PRODUCT_CHARACTERISTICS := nosdcard

#Android EGL implementation
PRODUCT_PACKAGES += libGLES_android

PRODUCT_PACKAGES += \
    libqcomvisualizer \
    libqcompostprocbundle

# Audio configuration file
PRODUCT_COPY_FILES += \
    device/qcom/msm8916_32/audio_policy.conf:system/etc/audio_policy.conf \
    device/qcom/msm8916_32/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    device/qcom/msm8916_32/mixer_paths_mtp.xml:system/etc/mixer_paths_mtp.xml \
    device/qcom/msm8916_32/mixer_paths_qrd_skuh.xml:system/etc/mixer_paths_qrd_skuh.xml \
    device/qcom/msm8916_32/mixer_paths_qrd_skui.xml:system/etc/mixer_paths_qrd_skui.xml \
    device/qcom/msm8916_32/mixer_paths_qrd_skuhf.xml:system/etc/mixer_paths_qrd_skuhf.xml \
    device/qcom/msm8916_32/mixer_paths_wcd9306.xml:system/etc/mixer_paths_wcd9306.xml \
    device/qcom/msm8916_32/mixer_paths_skuk.xml:system/etc/mixer_paths_skuk.xml \
    device/qcom/msm8916_32/mixer_paths.xml:system/etc/mixer_paths.xml \
    device/qcom/msm8916_32/sound_trigger_mixer_paths.xml:system/etc/sound_trigger_mixer_paths.xml \
    device/qcom/msm8916_32/sound_trigger_mixer_paths_wcd9306.xml:system/etc/sound_trigger_mixer_paths_wcd9306.xml \
    device/qcom/msm8916_32/sound_trigger_platform_info.xml:system/etc/sound_trigger_platform_info.xml


#ANT+ stack
PRODUCT_PACKAGES += \
    AntHalService \
    libantradio \
    antradio_app

PRODUCT_PACKAGES += wcnss_service

# MSM IRQ Balancer configuration file
PRODUCT_COPY_FILES += \
    device/qcom/msm8916_64/msm_irqbalance.conf:system/vendor/etc/msm_irqbalance.conf

#wlan driver
PRODUCT_COPY_FILES += \
    device/qcom/msm8916_64/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    device/qcom/msm8916_64/WCNSS_qcom_wlan_nv.bin:persist/WCNSS_qcom_wlan_nv.bin

PRODUCT_PACKAGES += \
    wpa_supplicant_overlay.conf \
    p2p_supplicant_overlay.conf

ifeq ($(TARGET_USES_QCA_NFC),true)
NFC_D := true

ifeq ($(NFC_D), true)
    PRODUCT_PACKAGES += \
        libqnfc-nci \
        libqnfc_nci_jni \
        nfc_nci.msm8916 \
        QNfc \
        Tag \
        com.android.nfc_extras \
        com.android.nfc.helper \
        SmartcardService \
        org.simalliance.openmobileapi \
        org.simalliance.openmobileapi.xml \
        libassd
else
    PRODUCT_PACKAGES += \
    libnfc-nci \
    libnfc_nci_jni \
    nfc_nci.msm8916 \
    NfcNci \
    Tag \
    com.android.nfc_extras
endif

# file that declares the MIFARE NFC constant
# Commands to migrate prefs from com.android.nfc3 to com.android.nfc
# NFC access control + feature files + configuration
PRODUCT_COPY_FILES += \
        packages/apps/Nfc/migrate_nfc.txt:system/etc/updatecmds/migrate_nfc.txt \
        frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
        frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
        frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
        frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml
endif # TARGET_USES_QCA_NFC
