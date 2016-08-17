LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libgpg
LOCAL_SRC_FILES := ../gpg/lib/gnustl/$(TARGET_ARCH_ABI)/libgpg.a
include $(PREBUILT_STATIC_LIBRARY)

LOCAL_MODULE := cocos2dcpp_shared

LOCAL_MODULE_FILENAME := libcocos2dcpp

LOCAL_ARM_MODE := arm

LOCAL_SRC_FILES := hellocpp/main.cpp \
../../Classes/AppDelegate.cpp \
../../Classes/HelloWorldScene.cpp

LOCAL_CPPFLAGS := -DSDKBOX_ENABLED
LOCAL_LDLIBS := -landroid \
-llog

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../Classes \
../gpg/include/ \
$(LOCAL_PATH)/..

LOCAL_WHOLE_STATIC_LIBRARIES := sdkbox \
PluginSdkboxGooglePlay \
gpg-1

LOCAL_STATIC_LIBRARIES := cocos2dx_static PluginSdkboxGooglePlay sdkbox

include $(BUILD_SHARED_LIBRARY)
$(call import-add-path, $(LOCAL_PATH))

$(call import-module, ./sdkbox)
$(call import-module, ./PluginSdkboxGooglePlay)
$(call import-module, ../gpg)
$(call import-module, ./prebuilt-mk)