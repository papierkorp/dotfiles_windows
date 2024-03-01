#!/bin/bash

echo "Pulling dotfiles..."
/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME" pull #pull dotfiles
echo "Pulling Windows dotfiles..."
/usr/bin/git --git-dir="/mnt/c/Users/Markus/.dotfiles" --work-tree="/mnt/c/Users/Markus" pull #pull windows dotfiles
