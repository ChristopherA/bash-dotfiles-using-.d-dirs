#!/bin/bash

# ~/.profile: executed by Bourne-compatible login shells.

# sourced by ~/.bash_profile or ~/.bashrc or ~/.zshrc

#####
### DETAILS:

# ~/.profile by default is not executed by bash if ~/.bash_profile, ~/.bash_login
# already exists (or on the Mac also if ~/.bashrc). However, as a legacy shell
# file it is executed by many other shells, so we use this file as useful place
# for common exported environmental variables and paths used by all shells.

# In this shell files setup, ~/.profile is either sourced by ~/.bash_profile or
# ~/.zshrc interactively (through a Terminal) or by ~/bashrc non-interactively
# (i.e. ssh, cron, etc.). Any non-interactive functions shoud be as
# lightweight (minimal) as possible to reduce the overhead when starting a
# non-login shell.

########
# Script Debugger

SCRIPT_DEBUG=true
#SCRIPT_DEBUG=false

# Test for a terminal (aka interactive)!

if [[ $- =~ "i" ]]
then # shell is NOT interactive thus echos and other output will not break SCP
  if $SCRIPT_DEBUG; then echo "    ~/.profile sourced."; fi
fi

########
### Source command environment scripts in ~/.profile.d

# Next we source any common environment scripts found in ~/.profile.d that
# that are need to setup both interactive and non-interactive shells, such as
# paths, functions, global aliases, etc.
#
# Remember that alls scripts in ~/.profile.d need to work properly in
# non-interactive mode and must ot echo or send output to console
#
# Keep the ~/.profile.d directory tidy!

if [[ $- =~ "i" ]]
then # shell is NOT interactive thus echos and other output will not break SCP
  if $SCRIPT_DEBUG; then echo "        ~/.profile.d sourced."; fi
fi

if [ -d ~/.bashrc.d ]; then
  for file in ~/.profile.d/*.sh; do
    source $file
    if [[ $- =~ "i" ]]
        then # shell is NOT interactive thus echos and other output will not break SCP
        if $SCRIPT_DEBUG; then echo "            ${file##*/} found."; fi
    fi
  done
fi

########
### Load ~?.profile.local

# ~/.profile.local is sourced for local and private settings that should not be 
# under version control (for instance git credentials) yet should be available
# to all shells.

if [ -f ~/.profile.local ]; then source ~/.profile.local; fi


########
### ~/.profile Complete

# All command enviroments scripts have been executed.

if [[ $- =~ "i" ]]
then # shell is NOT interactive thus echos and other output will not break SCP
  if $SCRIPT_DEBUG; then echo "    ~/.profile complete."; fi
fi
