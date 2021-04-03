#!/bin/bash

insults=(
    "Are you supposed to be in suoders, or did the sysadmin make a typo too?"
    "10-piece chicken fingers, now at localhost."
    "Are you SURE you typed that in right?"
    "People like you are why SELinux exists."
    "Fe fi fo fum, someone's typing out their bum."
)

num_insults=${#insults[@]}
echo ${insults[$(($RANDOM % num_insults))]}
sudo $@