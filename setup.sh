#!/bin/bash

sudo apt update -y
sudo apt upgrade -y



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



# Program: git-lfs
# Purpose: Version control.
# Quickstart: https://youtu.be/uLR1RNqJ1Mw
echo -e Installing \'git-lfs\'.
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt update -y
sudo apt install git-lfs -y



# Program: asdf
# Purpose: Tool version manager. e.g. Use a different Python, Java, Node, etc... version in each folder.
# Quickstart: https://asdf-vm.com/guide/introduction.html
echo -e Installing \'asdf\'.
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.2

bashrc_file=~/.bashrc

echo -e Configuring \'asdf\'.
echo -e "\n# asdf" >> $bashrc_file
echo . "$HOME/.asdf/asdf.sh" >> $bashrc_file
echo . "$HOME/.asdf/completions/asdf.bash" >> $bashrc_file
source $bashrc_file



# Program: direnv
# Purpose: Automatic loading of environment variables.
# Quickstart: https://direnv.net/
echo -e Installing \'direnv\'.
sudo apt install direnv -y

echo -e Configuring \'direnv\'.

direnv_folder=~/.config/direnv
direnv_file=$direnv_folder/direnv.toml
mkdir --parents $direnv_folder
touch $direnv_file
echo "[global]" >> $direnv_file
echo "load_dotenv = true" >> $direnv_file

echo -e "\n# direnv" >> $bashrc_file
echo "eval $(direnv hook bash)" >> $bashrc_file
source $bashrc_file



# Program: screen
# Purpose: Virtual terminal management.
# Quickstart: https://linuxhandbook.com/screen-command/
echo -e Installing \'screen\'.
sudo apt install screen -y

screenrc_file=~/.screenrc

echo -e Configuring \'screen\'.
touch $screenrc_file
echo -e "shell /bin/bash" >> $screenrc_file



# Program: lazydocker
# Purpose: A terminal UI for docker & docker-compose.
# Quickstart: https://github.com/jesseduffield/lazydocker#usage
echo -e Installing \'lazydocker\'.
asdf plugin add lazydocker https://github.com/comdotlinux/asdf-lazydocker.git
asdf install lazydocker latest
asdf global lazydocker latest
