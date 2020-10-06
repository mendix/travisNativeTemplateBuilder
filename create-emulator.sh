#!/bin/bash
export EMU_PARAMS="-verbose -no-snapshot -no-window -camera-back none -camera-front none -selinux permissive -qemu -m 2048"
export EMU_COMMAND="emulator"

echo y | sdkmanager --no_https "system-images;android-${COMPILE_API};${EMU_FLAVOR};${ABI}" # install our emulator
            # Set up KVM on linux for hardware acceleration. Manually here so it only happens for emulator tests, takes ~30s
sudo -E apt-get -yq --no-install-suggests --no-install-recommends install bridge-utils libpulse0 libvirt-bin qemu-kvm virtinst ubuntu-vm-builder >/dev/null
sudo adduser "$USER" libvirt
sudo adduser "$USER" kvm

echo no | avdmanager create avd --force -n TEST_DEVICE -k "system-images;android-${COMPILE_API};${EMU_FLAVOR};${ABI}" -c 100M # create device
sudo -E sudo -u "$USER" -E bash -c "${ANDROID_HOME}/emulator/${EMU_COMMAND} -avd TEST_DEVICE ${EMU_PARAMS} &"

echo 'Emu created'
