#!/usr/bin/env bash

# script to automatically install and run RStudio and Jupyter (with Anaconda3)
# on Jetstream
#
# user will be prompted for certain information as script runs
# passwords for RStudio and Jupyter are autmoatcially set to 'jetstream'

# install R
sudo apt-get install r-base

# install gdebi-core - necessary for building RStudio image
sudo apt-get install gdebi-core

# download RStudio server image and build from image
# you should get a message stating that RStudio is running
wget https://download2.rstudio.org/rstudio-server-1.1.423-amd64.deb
sudo gdebi rstudio-server-1.1.423-amd64.deb

# setup RStudio for login
# figure out username
user=`whoami`

# prompt user to enter new password
# this seems to always be necessary, so just have students do it by default
echo -e "Please choose a password for logging into RStudio."
sudo chpasswd ${user}:jetstream && \
echo -e "\nYou will need this password to log into RStudio."

# tell students the username they need to login
echo -e "\nYour RStudio username is ${user}."

# tell students the URL
echo -e "\nYour RStudio Web server is running at: http://$(hostname):8787/"

# download Anaconda installer script and install
wget https://repo.continuum.io/archive/Anaconda3-5.1.0-Linux-x86_64.sh
# run script to install. default settings should be fine. select yes to have Anaconda bin added to path
bash ./Anaconda3-5.1.0-Linux-x86_64.sh

# configure Jupyter with password 'jetstream'
~/carpentry_jetstream_setup/jupyter_setup.bash jetstream

# automatically start Jupyter with screen instance
screen -dmS jupyter bash -c 'jupyter notebook; exec bash'

# output URLs
echo "RStudio and Jetstream URLs are as follows:"
~/carpentry_jetstream_setup/url_reminder.bash
echo "Username = ${user}"
echo "Password (set automatically) = jetstream"
