#!/bin/bash

if [ ${BASH_VERSION:0:1} -lt 4 ]
then
    echo "suod requires Bash version 4.0 or higher. Your Bash version is ${BASH_VERSION}."
    exit 1
fi

# Set this variable to 1 to enable package manager name typo correction.
FIX_PKG_TYPOS=0
# Set this variable to 0 to disable the script's insults.
ENABLE_INSULTS=1

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
    "Tonight on \"Are You Smarter Than a Skiddy...\""
    "Keep your bad typing away from the production environment."
    "I don't believe \"vibe typing\" is a real thing..."
    "With the advent of the Steam Deck, noobs have flocked to Linux."
    "At least Steve Jobs cared about the products he marketed."
    "QA is dead and you're the poster child for that."
    "Remember to check your work!"
    "You specifically are why modern technology is so dumbed down."
    "Meet the 0.01X systems administrator: you."
    "^ Most botched command I've seen all day."
    "Let me guess: JavaScript developer?"
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

# Whether or not package manager name was corrected.
# 1 = corrected, other integers = not corrected
pkg_mgr_fixed=0

# Construct the full corrected command from the arguments.
if  [ $# -gt 0 ]; then
    # Only fix package manager name if a recognized typo was made.
    if [ $FIX_PKG_TYPOS == 1 ] && [ ! -z "${pkg_mgr_typos[$1]}" ]; then
        cmd+=${pkg_mgr_typos[$1]}
        pkg_mgr_fixed=1
    fi

    # If the package manager name was corrected, that means the first
    # element of the command sequence- start from the second instead.
    if [ $pkg_mgr_fixed -eq 1 ]; then
        for (( i=2; i<=$#; i++ ))
        do
            cmd+=(${!i})
        done
    else 
        for (( i=1; i<=$#; i++ ))
        do
            cmd+=(${!i})
        done
    fi
    
    eval set -- ${cmd[*]}
fi

if [ $ENABLE_INSULTS -eq 1 ]; then
    echo ${insults[$(($RANDOM % ${#insults[@]}))]}
else
    echo "sudo" "$@"
fi

sudo "$@"
