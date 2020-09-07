# Uncomment this to specify IP address of your device
# THEOS_DEVICE_IP=127.0.0.1

PACKAGE_VERSION = 0.0.1
ARCHS = arm64 arm64e
TARGET = iphone:13.3:latest

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = ItsAboutTime

ItsAboutTime_FILES = $(wildcard *m)
ItsAboutTime_CFLAGS = -fobjc-arc -I../
ItsAboutTime_PRIVATE_FRAMEWORKS = ClockKit NanoTimeKitCompanion
ItsAboutTime_INSTALL_PATH = /Library/Application Support/LockWatch2/Faces

include $(THEOS_MAKE_PATH)/bundle.mk

before-stage::
	@find . -name ".DS_Store" -delete