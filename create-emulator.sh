#!/bin/bash
set -ex

# Set up KVM on linux for hardware acceleration. Manually here so it only happens for emulator tests, takes ~30s
#sudo -E apt-get -yq --no-install-suggests --no-install-recommends install bridge-utils libpulse0 libvirt-bin qemu-kvm virtinst ubuntu-vm-builder >/dev/null
sudo apt-get install qemu-kvm libvirt-daemon-system libvirt-clients >/dev/null
sudo apt-get install bridge-utils
sudo adduser "$USER" libvirt
sudo adduser "$USER" kvm

echo no | avdmanager create avd --force -n TEST_DEVICE -k "system-images;android-${COMPILE_API};google_apis;x86_64" -c 100M # create device
sudo -E sudo -u "$USER" -E bash -c "emulator -avd TEST_DEVICE -verbose -no-snapshot -no-window -camera-back none -camera-front none -selinux permissive -qemu -m 2048 &"


echo 'Emu created'
