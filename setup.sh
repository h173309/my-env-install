#!/bin/sh

cd ~

##########################################################################
## install Anaconda 3 ###################################################
##########################################################################
# if your OS is Linux
wget https://repo.anaconda.com/archive/Anaconda3-2018.12-Linux-x86_64.sh

sh Anaconda3-2018.12-Linux-x86_64.sh
# add Anaconda to PATH
echo -e "# added by Anaconda3 installer"                >> ~/.bashrc
echo -e 'if [ -d "${HOME}/anaconda3" ] ; then'          >> ~/.bashrc
echo -e '  export PATH=\"${HOME}/anaconda3/bin:$PATH\"' >> ~/.bashrc
echo -e 'fi'                                            >> ~/.bashrc
source ~./bashrc
##########################################################################

jupyter notebook --generate-config
SHA_TMP=`ipython -c 'from IPython.lib import passwd; passwd()' | cut -d' ' -f2`
echo -e "c.NotebookApp.ip = '0.0.0.0'"                                                                 >> ~/.jupyter/jupyter_notebook_config.py
echo -e "c.NotebookApp.password = u${SHA_TMP}"                                                         >> ~/.jupyter/jupyter_notebook_config.py
echo -e "c.NotebookApp.open_browser = False"                                                           >> ~/.jupyter/jupyter_notebook_config.py
echo -e "c.NotebookApp.port = 8888"                                                                    >> ~/.jupyter/jupyter_notebook_config.py
echo -e "c.NotebookApp.kernel_spec_manager_class = 'environment_kernels.EnvironmentKernelSpecManager'" >> ~/.jupyter/jupyter_notebook_config.py
echo -e "c.EnvironmentKernelSpecManager.conda_env_dirs=['${HOME}/anaconda3/envs/']"                    >> ~/.jupyter/jupyter_notebook_config.py
unset SHA_TMP
