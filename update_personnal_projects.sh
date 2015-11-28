#!/bin/sh

# The root folder of your AOSP
android_root_path=/home/khaon/android/rom/aosp_master;

# Write here the personnal projects
project_list="frameworks/base build system/core packages/apps/Settings external/e2fsprogs";

# Remote and branch names
remote_name="aosp";
branch_name="master";

# The git command to be executed
git_command="git fetch --all; git merge $remote_name/$branch_name --no-edit && git pp;"

# Color parameters
bold=$(tput bold);
green=${bold}$(tput setaf 2); # green
normal=$(tput sgr0);

for project in $project_list; do
	cd "$android_root_path/$project";
	echo "${green} $project ${normal}";
	eval $git_command;
done;
