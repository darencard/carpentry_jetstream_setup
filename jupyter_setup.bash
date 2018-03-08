#!/usr/bin/env bash

# a wrapper script that sets up Jupyter
# runs 'set_jupyter_password.py' internally to create password
#     hash from user-specified password (see argument)
# runs 'setup_jupyter_config.bash' internally to use password
#     hash to setup the full Jupyter configuration to run the server
# optionally, can uncomment lines to have Jupyter automatically started
# optionally, can run 'jupyter lab' instead of default 'jupyter notebook'
# argument 1: a use-specified password

# make sure new path is sourced
export PATH=$PATH:~/anaconda3/bin

# accept user-defined password or use default of 'password'
if [ -n "$1" ]
then
   pass=$1
else
   pass=password
fi

# use python script to set password based on user argument
password=`~/carpentry_jetstream_setup/set_jupyter_password.py ${pass}`

# feed password hash into jupyter configuration script at ~/.jupyter
~/carpentry_jetstream_setup/setup_jupyter_config.bash ${password}

# run jupyter notebook automatically in background screen
# uncomment to have this done
# screen -dmS jupyter bash -c 'jupyter notebook; exec bash'

# can also run Jupyter "Lab" instead of "Notebook"
# screen -dmS jupyter bash -c 'jupyter lab; exec bash'

# report password to user
echo -e "Your RStudio password is ${pass}."

# tell user where to go
echo -e "\nYour Jupyter Web server will run at: https://$(hostname):8888/"
