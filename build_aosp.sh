#!/bin/bash

# Root of the build script folder
build_scripts_dir=/home/khaon/android/rom/build_scripts;

# The root and out folder of your AOSP
android_root_path=/home/khaon/android/rom/aosp_master;
android_out_folder=~/out/aosp_master;
# Your device lunch combo
device_lunch_number=23;

# Clean first the out folder
rm -rf $android_out_folder;

#Update our personal projects before repo syncing
sh $build_scripts_dir/update_personnal_projects.sh;

cd $android_root_path;

repo sync -j5 --force-sync -f;
source build/envsetup.sh
lunch $device_lunch_number;
make -j$(cat /proc/cpuinfo | grep processor | wc -l) otapackage;