#!/usr/bin/env bash

# a script that makes user specify a new, temporary password for RStudio login
# RStudio should already be running

# make sure new path is sourced
source ~/.bashrc

# figure out username
user=`whoami`

# prompt user to enter new password
# this seems to always be necessary, so just have students do it by default
echo -e "Please choose a password for logging into RStudio."
sudo passwd ${user} && \
echo -e "\nYou will need this password to log into RStudio."

# tell students the username they need to login
echo -e "\nYour RStudio username is ${user}."

# tell students the URL
echo -e "\nYour RStudio Web server is running at: http://$(hostname):8787/"
