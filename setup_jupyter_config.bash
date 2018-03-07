#!/usr/bin/env bash

# a script to generate Jupyter configuration file for server
# argument 1: password hash created by passwd()

# start up configuration
jupyter notebook --generate-config
mkdir ~/certs
sudo openssl req -x509 -nodes -days 365 -newkey rsa:1024 \
-keyout ~/certs/mycert.pem -out ~/certs/mycert.pem

# read path to certificate location
certpath=`readlink -f ~/certs/mycert.pem`

# write configuration to proper location
echo -e "c = get_config()\n\
c.IPKernelApp.pylab = 'inline'\n\
c.NotebookApp.certfile = u'${certpath}'\n\
c.NotebookApp.ip = '*'\n\
c.NotebookApp.open_browser = False\n\
c.NotebookApp.password = u'${1}'" \
> ~/.jupyter/jupyter_notebook_config.py
