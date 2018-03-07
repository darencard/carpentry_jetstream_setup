#!/usr/bin/env python

# script to generate a password hash for Jupyter

# import modules
import sys
from IPython.lib import passwd

# Create hash of password
passwd_hash = passwd(sys.argv[1])

# write password to stdout
sys.stdout.write(passwd_hash+"\n")
