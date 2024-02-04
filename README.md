# dotfiles bare git repo

Idea from: https://www.anand-iyer.com/blog/2018/a-simpler-way-to-manage-your-dotfiles/

to be used together with a dotfiles Repo for my WSL

# Initial Setup

```bash
mkdir /mnt/c/Users/Markus/.dotfiles
git init --bare /mnt/c/Users/Markus/.dotfiles
alias dotfiles_windows='/usr/bin/git --git-dir=/mnt/c/Users/Markus/.dotfiles --work-tree=/mnt/c/Users/Markus'
dotfiles_windows config --local status.showUntrackedFiles no
dotfiles_windows remote add origin git@github.com:papierkorp/dotfiles_windows.git
dotfiles_windows add ~/.bash_aliases
dotfiles_windows push
```

# Usage

!!to be tested!!

```bash
git clone --separate-git-dir=$HOME/.dotfiles git@github.com:papierkorp/dotfiles_windows.git tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
rm -r tmpdotfiles

git clone --separate-git-dir=$HOME/.dotfiles git@github.com:papierkorp/dotfiles_windows.git ~
```
