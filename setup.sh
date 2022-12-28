#!/bin/bash

sudo apt update -y;
sudo apt upgrade -y;



# Program: sed
# Purpose: Text transformation utility.
# Quickstart: https://youtu.be/nXLnx8ncZyE

echo -e Installing \'sed\'.
sudo apt install sed -y



# Program: nano
# Purpose: Terminal-based text editor.
# Quickstart: https://youtu.be/DLeATFgGM-A

echo -e Installing \'nano\'.
sudo apt install nano -y

echo -e Configuring \'nano\'.
settings_file=/etc/nanorc
sudo sed -i 's/# set autoindent/set autoindent/' $settings_file
sudo sed -i 's/# set historylog/set historylog/' $settings_file
sudo sed -i 's/# set indicator/set indicator/' $settings_file
sudo sed -i 's/# set linenumbers/set linenumbers/' $settings_file
sudo sed -i 's/# set locking/set locking/' $settings_file
sudo sed -i 's/# set mouse/set mouse/' $settings_file
sudo sed -i 's/# set smooth/set smooth/' $settings_file
sudo sed -i 's/# set stateflags/set stateflags/' $settings_file
sudo sed -i 's/# set suspendable/set suspendable/' $settings_file
sudo sed -i 's/# include "/usr/share/nano/*.nanorc"/include "/usr/share/nano/*.nanorc"/' $settings_file

echo -e Prompting user to set \'nano\' as the default editor.
sudo update-alternatives --config editor



# Program: FFMPEG
# Purpose: CLI program for file transcoding, streaming, and playing.
# Additional Links:
#	https://ffmpeg.org/download.html
echo -e Installing \'FFMPEG\'.
sudo apt install ffmpeg -y



# Program: git
# Purpose: Version control.
# Quickstart: https://youtu.be/u1Zvkqjx0Ik

echo -e Installing \'git\'.
sudo apt install git -y

echo -e Configuring \'git\'.
git config --global color.ui auto
git config --global core.editor "nano"



# Program: Python
# Purpose: Programming language.
# Quickstart: 
# Additional Links:
#	https://docs.python-guide.org/starting/install3/linux/
#	https://launchpad.net/~deadsnakes/+archive/ubuntu/ppa
#	https://stackoverflow.com/a/61210682/13279616

echo -e Installing \'python\'.
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update -y
sudo apt install python3.11

echo -e Configuring \'python\'.
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.11 10



# Program: pip
# Purpose: Package manager for Python.
# Additional Links:
#	https://pip.pypa.io/en/latest/installation/

echo -e Installing \'pip\'.
python -m ensurepip --upgrade
