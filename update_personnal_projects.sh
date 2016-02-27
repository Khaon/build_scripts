#!/bin/bash

# The root folder of your AOSP
android_root_path=/home/khaon/android/rom/aosp_master;

# Write here the personnal projects
project_list="frameworks/base build system/core packages/apps/Settings external/e2fsprogs";

# AOSP remote and branch names
asop_remote_name="aosp";
aosp_branch_name="master";

# GITHUB remote and branch names
github_remote_name="github";
github_remote_branch_name="master";

# The git command to be executed
git_command="git fetch --all; git merge $asop_remote_name/$aosp_branch_name --no-edit && git push $github_remote_name HEAD:$github_remote_branch_name;"

# Color parameters
bold=$(tput bold);
green=${bold}$(tput setaf 2); # green
normal=$(tput sgr0);

for project in $project_list; do
	cd "$android_root_path/$project";
	echo "${green} $project ${normal}";
	eval $git_command;
done;
