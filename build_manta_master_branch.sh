#!/bin/sh

cd /home/khaon/android/rom/aosp_master;
rm -rf  ~/out/aosp_master;

repo sync -f --force-sync -j9;

. build/envsetup.sh
lunch 23;
make -j2 otapackage;

mv /home/khaon/android/Packages/roms/aosp_master_branch/*.zip /home/khaon/android/Packages/roms/aosp_master_branch/old_releases;
cp /home/khaon/out/aosp_master/target/product/manta/aosp_manta-*.zip /home/khaon/android/Packages/roms/aosp_master_branch;

# Generate OTA file
sh /home/khaon/android/rom/OTA/buildMasterMantaOTAFile.sh;