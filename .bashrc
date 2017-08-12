#!/bin/bash

# ~/.bashrc: executed by bash(1) for non-login shells.

########
### DETAILS:

# ~/.bashrc is normally executed by bash only for non-login shells such as ssh,
# scp, cron, etc. Thus any functions called by ~/.bashrc should be as lightweight
# (minimal) as possible to reduce the overhead when starting a non-login shell.

# We also want to be careful as these shells are non-interactive, which means
# we should to never echo or send any any other output to console, or it will
# break non-interactive services like scp.

########
### Script Debugger

#SCRIPT_DEBUG=true
#SCRIPT_DEBUG=false

# Test for a terminal (aka interactive)!

if [[ $- =~ "i" ]]
then # shell is NOT interactive thus echos and other output will not break SCP
  if $SCRIPT_DEBUG; then echo "   ~/.bashrc sourced."; fi
fi

########
### Source common environment & paths from ~/.profile

# In this shell setup, ~/.bashrc should be only be executed by non-interactive
# shells. However, we want a common environment and path settings for both
# interactive shells (bash, zsh, csh and others) and non-interactive ones
# (ssh, scp, cron, etc.).

# Thus we source ~/.profile here to set all common environment and path
# settings, as later non-interactive scripts or functions may need them. Note
# that ~/.profile may also source ~/.profile.local for local and private settings
# that should not be under version control (for instance user credentials) yet
# should be available to all shells (e.g. git credentials).

if [ -f ~/.profile ]; then source ~/.profile; fi

########
### Source non-interactive scripts in ~/.bashrc.d

# Next we source any bash non-interactive specific scripts that may be
# found in ~/.bashrc.d
#
# Remember that alls scripts in ~/.bashrc.d need to work properly in
# non-interactive mode and must not echo or send output to console
#
# Keep the ~/.bashrc.d directory tidy!

if [[ $- =~ "i" ]]
then # shell is NOT interactive thus echos and other output will not break SCP
  if $SCRIPT_DEBUG; then echo "   ~/.bashrc.d sourced."; fi
fi

if [ -d ~/.bashrc.d ]; then
  for file in ~/.bashrc.d/*.sh; do
    source $file
    if [[ $- =~ "i" ]]
        then # shell is NOT interactive thus echos and other output will not break SCP
        if $SCRIPT_DEBUG; then echo "          ${file##*/} found."; fi
    fi
  done
fi

#######
### ~/.bashrc Complete

# All non-interactive functionality has been executed

if [[ $- =~ "i" ]]
then # shell is NOT interactive thus echos and other output will not break SCP
  if $SCRIPT_DEBUG; then echo "   ~/.bashrc completed."; fi
fi


########
