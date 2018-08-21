# Scripts for Provisioning a Jetstream VM for Software/Data Carpentry workshops

### Directions for RStudio Server

1. Connect to your running virtual machine through the web terminal or your local shell. These instructions assume an Ubuntu 16.04 VM. We will work from the `$HOME` directory so the scripts run properly.

2. Clone this repository.
```bash
# git is already installed
git clone https://github.com/darencard/carpentry_jetstream_setup.git
```

3. Install R using apt-get.
```bash
sudo apt-get install r-base
```

4. Download and run RStudio.
```bash
# install gdebi-core - necessary for building RStudio image
sudo apt-get install gdebi-core

# download RStudio server image and build from image
# you should get a message stating that RStudio is running
wget https://download2.rstudio.org/rstudio-server-1.1.456-amd64.deb
sudo gdebi rstudio-server-1.1.456-amd64.deb
```

5. Setup RStudio with a login password
```bash
# replace <password> with desired login password
# if no <password> is passed, default "password" is used
carpentry_jetstream_setup/rstudio_setup.bash <password>
```

6. Note the URL and user name outputted from the previous command and point your local browser to that URL. You will be prompted to sign in with your username and password. In the top right corner you will see a button to 'Sign Out' or to 'Quit the current R session' (which will give you a fresh R session).

7. If you lose track of your URL, you can run the following command to remind you of what it is.
```bash
carpentry_jetstream_setup/url_reminder.bash
```


### Directions for Jupyter Server

1. Connect to your running virtual machine through the web terminal or your local shell. These instructions assume an Ubuntu 16.04 VM. We will work from the `$HOME` directory so the scripts run properly.

2. Clone this repository (if you didn't already).
```bash
# git is already installed
git clone https://github.com/darencard/carpentry_jetstream_setup.git
```

3. Install Anaconda3.
```bash
# download Anaconda installer script and install
wget https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh
# run script to install. default settings should be fine. select yes to have Anaconda bin added to path
bash ./Anaconda3-5.2.0-Linux-x86_64.sh
```

4. Configure Jupyter.
```bash
# source ~/.bashrc to make sure new programs are in path
source ~/.bashrc
# create a password hash
# replace <password> with desired login password
password=`~/carpentry_jetstream_setup/set_jupyter_password.py <password>`
# use password hash to configure SSL certificate
carpentry_jetstream_setup/setup_jupyter_config.bash ${password}
# change group on SSL certificate so it isn't root
sudo chown `whoami`:`whoami` ~/certs/mycert.pem
```

5. Run Jupyter.
```bash
# probably best to open a new screen so you can leave it running if you get logged out
screen -S jupyter-nb
# now start Jupyter
jupyter notebook
# alternatively, can use Jupyter Lab IDE instead easily
screen -S jupyter-lab
jupyter lab
```

6. Note the URL outputted from the previous command and point your local browser to that URL. You will be prompted for your password. In the top right corner you will see a button to 'Logout'.

7. If you lose track of your URL, you can run the following command to remind you of what it is.
```bash
carpentry_jetstream_setup/url_reminder.bash
```


### Further Reading

These methods were based in part on blog posts outlining how to serve [RStudio](https://angus.readthedocs.io/en/2017/visualizing-blast-scores-with-RStudio.html#installing-and-running-rstudio-on-jetstream) and [Jupyter](https://hackernoon.com/aws-ec2-part-4-starting-a-jupyter-ipython-notebook-server-on-aws-549d87a55ba9) on remote VMs.

These same general instructions should work on other VM services, like [Amazon Web Services](https://aws.amazon.com/), but may require some modifications.

For more information on acquiring a Jetstream allocation for educational computational workshops, see [this post from the Berkeley Institute for Data Science](http://research-it.berkeley.edu/blog/17/02/17/jetstream-cloud-support-multi-institutional-data-science-workshops-and-research).
