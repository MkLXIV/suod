#!/bin/bash

if [ ${BASH_VERSION:0:1} -lt 4 ]
then
    echo "suod requires Bash version 4.0 or higher. Your Bash version is ${BASH_VERSION}."
    exit 1
fi

# Change this variable to 1 to enable package manager name typo correction.
FIX_PKG_TYPOS=0

insults=(
    "Are you supposed to be in sudoers, or did the sysadmin make a typo too?"
    "10-piece chicken fingers, now at localhost."
    "Are you SURE you typed that in right?"
    "People like you are why SELinux exists."
    "Fe fi fo fum, I smell the blood of skiddy scum."
    "I could run gtypist for you as well."
    "Type that in again, except slowly."
    "I feel sorry for your IT department."
    "You strike me as the type to give out your password for chocolate."
    "You could've just copied and pasted the command, you know."
    "How much do YOU think this advanced operating environment is worth?"
    "Your histfile must be HUGE."
    "Don't type with oven mits on."
    "The good ol' cat-walking-on-the-keyboard trick."
    "Wash your hands so you don't slip."
    "How many years of experience did you say you have again?"
    "There's several good reasons you're not the sysadmin."
)

# Package manager name typos and their corresponding correct names.
declare -A pkg_mgr_typos=(
    [atp]=apt
    [dfn]=dnf
    [emereg]=emerge
    [emrge]=emerge
    [emrege]=emerge
    [pcaman]=pacman
    [pacamn]=pacman
    [pacmna]=pacman
    [xpbs]=xbps
    [xbsp]=xbps
    [zypepr]=zypper
    [zypeppr]=zypper
)

# Stores the rest of the command to be run as root.
declare -a cmd

# Construct the full corrected command from the arguments.
if [ $FIX_PKG_TYPOS == 1 ] && [ $# -gt 0 ] && [ ! -z "${pkg_mgr_typos[$1]}" ]
then
    cmd+=${pkg_mgr_typos[$1]}

    # Only add the other agruments if they exist.
    if [ $# -gt 1 ]; then
        for (( i=2; i<=$#; i++ ))
        do
            cmd+=(${!i})
        done
    fi
    eval set -- ${cmd[*]}
fi

echo ${insults[$(($RANDOM % ${#insults[@]}))]}
sudo "$@"