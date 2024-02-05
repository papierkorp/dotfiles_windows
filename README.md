# dotfiles bare git repo

Idea from: https://www.anand-iyer.com/blog/2018/a-simpler-way-to-manage-your-dotfiles/

to be used together with a dotfiles Repo for my WSL

# Initial Setup

```bash
mkdir /mnt/c/Users/Markus/.dotfiles
git init --bare /mnt/c/Users/Markus/.dotfiles
alias dotfw='/usr/bin/git --git-dir=/mnt/c/Users/Markus/.dotfiles --work-tree=/mnt/c/Users/Markus'
dotfw config --local status.showUntrackedFiles no
dotfw remote add origin git@github.com:papierkorp/dotfiles_windows.git
dotfw add ~/.bash_aliases
dotfw push
```

# Usage

```bash
touch .gitconfig .gitconfig_privat
git clone --separate-git-dir=/mnt/c/Users/Markus/.dotfiles git@github.com:papierkorp/dotfiles_windows.git tmpdotfiles
rm .gitconfig*
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ /mnt/c/Users/Markus/
rm -r tmpdotfiles
```
