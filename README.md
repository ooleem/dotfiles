# How to setup a development machine on ec2
- Create an instance with EBS volume
- Create an account
```
ssh-add ~/.ssh/ec2.pem
ssh ubuntu@ip.com
sudo useradd -d /home/ooleem -m ooleem
sudo passwd ooleem
sudo adduser ooleem sudo
su - ooleem
ssh-keygen -t rsa
# add ssh key to it
vim ~/.ssh/authorized_keys
```

- Install git
```
ssh ooleem@ip.com
sudo apt-get update
sudo apt-get install git
```

- Install oh-my-zsh https://github.com/robbyrussell/oh-my-zsh
```
sudo apt-get install zsh
chsh
Follow the instructions on oh-my-zsh
cd ~/.oh-my-zsh
git remote add ooleem https://github.com/ooleem/oh-my-zsh.git
git pull ooleem master
```
  Copy .zshrc

- Setup dotfiles
```
git clone git://github.com/ooleem/dotfiles.git
```

- Setup vim
  Install vundle https://github.com/gmarik/vundle
  `ln -s ~/dotfiles/vimrc ~/.vimrc`

- Install rvm https://rvm.io/

- Install wemux https://github.com/zolrath/wemux

