#!/bin/sh
## author h173309
## 20190518

cd ~

##########################################################################
## install Anaconda 3 ####################################################
##########################################################################
# if your OS is Linux
wget https://repo.anaconda.com/archive/Anaconda3-2018.12-Linux-x86_64.sh

sh Anaconda3-2018.12-Linux-x86_64.sh
# add Anaconda to PATH
echo -e "# added by Anaconda3 installer"                >> ~/.bashrc
echo -e 'if [ -d "${HOME}/anaconda3" ] ; then'          >> ~/.bashrc
echo -e '  export PATH=${HOME}/anaconda3/bin:$PATH'     >> ~/.bashrc
echo -e 'fi'                                            >> ~/.bashrc
source ~/.bashrc

##########################################################################
## setting Jupyter notebook ##############################################
##########################################################################
# make config file -> .jupyter/jupyter_notebook_config.py
jupyter notebook --generate-config

# SHA_TMP < sha_hash
SHA_TMP=`ipython -c 'from IPython.lib import passwd; passwd()' | cut -d' ' -f3`
# allow all ip
echo -e "c.NotebookApp.ip = '0.0.0.0'"                                                                 >> ~/.jupyter/jupyter_notebook_config.py
echo -e "c.NotebookApp.password = u${SHA_TMP}"                                                         >> ~/.jupyter/jupyter_notebook_config.py
echo -e "c.NotebookApp.open_browser = False"                                                           >> ~/.jupyter/jupyter_notebook_config.py
# port number is able to change if you want
echo -e "c.NotebookApp.port = 8888"                                                                    >> ~/.jupyter/jupyter_notebook_config.py
# need to 'environment_kernels'
echo -e "c.NotebookApp.kernel_spec_manager_class = 'environment_kernels.EnvironmentKernelSpecManager'" >> ~/.jupyter/jupyter_notebook_config.py
echo -e "c.EnvironmentKernelSpecManager.conda_env_dirs=['${HOME}/anaconda3/envs/']"                    >> ~/.jupyter/jupyter_notebook_config.py
unset SHA_TMP

# enable to change conda-env in jupyter notebook
pip install environment_kernels
