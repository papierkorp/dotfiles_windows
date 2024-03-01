#!/bin/bash

echo "Pushing Dotfiles"
/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME" add -u
/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME" commit -m "pushed with daily script"
/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME" push
echo "Push of dotfiles successfull."

echo "Pushing Windows Dotfiles"
/usr/bin/git --git-dir="/mnt/c/Users/Markus/.dotfiles" --work-tree="/mnt/c/Users/Markus" add -u
/usr/bin/git --git-dir="/mnt/c/Users/Markus/.dotfiles" --work-tree="/mnt/c/Users/Markus" commit -m "pushed with daily script"
/usr/bin/git --git-dir="/mnt/c/Users/Markus/.dotfiles" --work-tree="/mnt/c/Users/Markus" push

echo "Push of windows dotfiles successfull."
