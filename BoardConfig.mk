# config.mk
#
# Product-specific compile-time definitions.
#

TARGET_BOARD_PLATFORM := msm8916
TARGET_BOOTLOADER_BOARD_NAME := msm8916

BOARD_USES_GENERIC_AUDIO := true
USE_CAMERA_STUB := true

-include $(QCPATH)/common/msm8916/BoardConfigVendor.mk

# bring-up overrides
BOARD_USES_GENERIC_AUDIO := true
USE_CAMERA_STUB := true

NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a9

TARGET_NO_BOOTLOADER := false
TARGET_NO_KERNEL := false

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x02000000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x02000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 838860800
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2013265920
BOARD_CACHEIMAGE_PARTITION_SIZE := 134217728
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

TARGET_USES_ION := true
TARGET_USES_NEW_ION_API :=true
TARGET_USES_QCOM_BSP := false
TARGET_NO_RPC := true

BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci earlyprintk
BOARD_KERNEL_SEPARATED_DT := true

BOARD_KERNEL_BASE        := 0x80000000
BOARD_KERNEL_PAGESIZE    := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET     := 0x02000000

TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
TARGET_USES_UNCOMPRESSED_KERNEL := true

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

BOARD_EGL_CFG := device/qcom/msm8916_64/egl.cfg
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/
# Add NON-HLOS files for ota upgrade
ADD_RADIO_FILES := true
TARGET_RECOVERY_UPDATER_LIBS += librecovery_updater_msm
