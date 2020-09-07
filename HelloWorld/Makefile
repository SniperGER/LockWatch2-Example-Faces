# Uncomment this to specify IP address of your device
# THEOS_DEVICE_IP=127.0.0.1

# Specify the package version to keep the ~debug suffix away, even in debug builds
PACKAGE_VERSION = 0.0.1

# Specify the supported architectures. arm64 = iPhone 6s - iPhone X, arm64e = iPhone Xs or later
ARCHS = arm64 arm64e

# Specify the compiler target. This bundle is compiled for iOS (aka. iphoneos), uses the 13.3 SDK, and is targeted at the latest version
TARGET = iphone:13.3:latest

# Restart SpringBoard after installing this package
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

# "Create" a bundle called "Hello World"
BUNDLE_NAME = HelloWorld

# Compile every Objective-C source file in this folder
HelloWorld_FILES = $(wildcard *m)

# Enable ARC, and import global headers
HelloWorld_CFLAGS = -fobjc-arc -I../

# Link required frameworks, so we can create subclasses of existing watch face classes
HelloWorld_PRIVATE_FRAMEWORKS = ClockKit NanoTimeKitCompanion

# This is the install path. Do not change this, or your watch face won't show up!
HelloWorld_INSTALL_PATH = /Library/Application Support/LockWatch2/Faces

include $(THEOS_MAKE_PATH)/bundle.mk

# Clean up stuff before creating the installable package
before-stage::
	@find . -name ".DS_Store" -delete