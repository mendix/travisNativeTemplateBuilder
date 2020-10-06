#!/bin/bash


wget -q "$ANDROID_TOOLS_URL" -O android-sdk-tools.zip
unzip -q android-sdk-tools.zip -d "$ANDROID_HOME"
rm android-sdk-tools.zip
mkdir "$HOME"/.android
touch "$HOME"/.android/repositories.cfg
echo y | sdkmanager --licenses >/dev/null

if [ -d "${ANDROID_HOME}/platform-tools" ]; then
  echo y | sdkmanager --no_https "platform-tools" >/dev/null # adb logcat fastboot
fi

if [ -d "${ANDROID_HOME}/tools" ]; then
  echo y | sdkmanager --no_https "tools" >/dev/null #  avdmanager, sdkmanager
fi

if [ -d "${ANDROID_HOME}/build-tools/${ANDROID_BUILD_TOOLS}" ]; then
  echo y | sdkmanager --no_https "build-tools;${ANDROID_BUILD_TOOLS}" >/dev/null # apksigner is needed
fi

if [ -d "${ANDROID_HOME}/platforms/android-${COMPILE_API}" ]; then
  echo y | sdkmanager --no_https "platforms;android-${COMPILE_API}" >/dev/null # actual image
fi

echo y | sdkmanager --no_https "emulator" >/dev/null # duh
echo 'Finished installing packages'

