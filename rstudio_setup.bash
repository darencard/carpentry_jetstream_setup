#!/usr/bin/env bash

# a script that makes user specify a new, temporary password for RStudio login
# RStudio should already be running
# argument 1: a password

# make sure new path is sourced
source ~/.bashrc

# figure out username
user=`whoami`

# accept user-defined password or use default of 'password'
if [ -n "$1" ]
then
   pass=$1
else
   pass=password
fi

# prompt user to enter new password
# this seems to always be necessary, so just have students do it by default
echo -e "Please choose a password for logging into RStudio."
echo "${user}:${pass}" | sudo chpasswd && \
echo -e "\nYou will need this password to log into RStudio."

# tell students the username they need to login
echo -e "\nYour RStudio username is ${user}."

# tell students the URL
echo -e "\nYour RStudio Web server is running at: http://$(hostname):8787/"
