# Scripts for Provisioning a Jetstream VM for Software/Data Carpentry workshops

### Directions for RStudio Server

1. Connect to your running virtual machine through the web terminal or your local shell. These instructions assume an Ubuntu 16.04 VM.

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
wget https://download2.rstudio.org/rstudio-server-1.1.423-amd64.deb
sudo gdebi rstudio-server-1.1.423-amd64.deb
```

5. Setup RStudio with a login password
```bash
carpentry_jetstream_setup/rstudio_setup.bash
```

6. Note the URL and user name outputted from the previous command and point your browser to that URL. You will be prompted to sign in with your username and password. In the top right corner you will see a button to 'Sign Out' or to 'Quit the current R session' (which will give you a fresh R session).

7. If you lose track of your URL, you can run the following command to remind you of what it is.
```bash
carpentry_jetstream_setup/url_reminder.bash
```


### Directions for Jupyter Server

1. Connect to your running virtual machine through the web terminal or your local shell. These instructions assume an Ubuntu 16.04 VM.

2. Clone this repository (if you didn't already).
```bash
# git is already installed
git clone https://github.com/darencard/carpentry_jetstream_setup.git
```

3. Install Anaconda3.
```bash
# download Anaconda installer script and install
wget https://repo.continuum.io/archive/Anaconda3-5.1.0-Linux-x86_64.sh
# run script to install. default settings should be fine. select yes to have Anaconda bin added to path
bash ./Anaconda3-5.1.0-Linux-x86_64.sh
```

4. Configure Jupyter.
```bash
# replace <password> with desired login password
carpentry_jetstream_setup/jupyter_setup.bash <password>
```

5. Run Jupyter.
```bash
# probably best to open a new screen so you can leave it running if you get logged out
screen -S jupyter
# now start Jupyter
jupyter notebook
# alternatively, can use Jupyter Lab IDE instead easily
jupyter lab
```

6. Note the URL outputted from the previous command and point your browser to that URL. You will be prompted for your password. In the top right corner you will see a button to 'Logout'.

7. If you lose track of your URL, you can run the following command to remind you of what it is.
```bash
carpentry_jetstream_setup/url_reminder.bash
```


### Further Reading

These methods were based in part on blog posts outlining how to serve [RStudio](https://angus.readthedocs.io/en/2017/visualizing-blast-scores-with-RStudio.html#installing-and-running-rstudio-on-jetstream) and [Jupyter](https://hackernoon.com/aws-ec2-part-4-starting-a-jupyter-ipython-notebook-server-on-aws-549d87a55ba9) on remote VMs.

These same general instructions should work on other VM services, like [Amazon Web Services](https://aws.amazon.com/), but may require some modifications.
