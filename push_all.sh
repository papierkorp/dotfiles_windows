#!/bin/bash

system_info=$(uname -a)
repos_privat=("cheatsheet" "lanparty" "blog" "THM" "horizon-flow" "godot/beastmaster")

# Check if the system_info contains "MINGW64" to identify Windows
if [[ $system_info == *"MINGW64"* ]]; then
    echo "executing gitbash script.."

    for repo in "${repos_privat[@]}"
    do
        echo "Pushing Private - $repo..."
        cd "C:/develop/privat/$repo" || return
        git add -u
        git commit -m "pushed with daily script"
        git push
        echo -e "Push of $repo successfull. \n \n"
    done

    for repo in "${repos_privat[@]}"
    do
        echo "Pushing Private - $repo..."
        cd "C:/develop/$repo" || return
        git add -u
        git commit -m "pushed with daily script"
        git push
        echo -e "Push of $repo successfull. \n \n"
    done

    echo "Pushing todo\`s.."
    cd "C:/develop/sirconic/todo" || return
    git add -u
    git commit -m "pushed with daily script"
    git push
    echo "Push of todo\`s successfull."


    echo "Pushing SublimeText"
    cd "C:/Users/Markus/AppData/Roaming/Sublime Text/Packages/User" || return
    git add -u
    git commit -m "pushed with daily script"
    git push
    echo "Push of Sublime Text successfull."

elif [[ $system_info == *"Linux"* ]]; then
    echo "executing wsl script.."

    for repo in "${repos_privat[@]}"
    do
        echo "Pushing $repo..."
        cd "/mnt/c/develop/privat/$repo" || return
        git add -u
        git commit -m "pushed with daily script"
        git push
        echo -e "Push of $repo successfull. \n \n"
    done

    for repo in "${repos_privat[@]}"
    do
        echo "Pushing $repo..."
        cd "/mnt/c/develop/$repo" || return
        git add -u
        git commit -m "pushed with daily script"
        git push
        echo -e "Push of $repo successfull. \n \n"
    done

    echo "Pushing todo\`s.."
    cd "/mnt/c/develop/sirconic/todo" || return
    git add -u
    git commit -m "pushed with daily script"
    git push
    echo "Push of todo\`s successfull."


    echo "Pushing SublimeText"
    cd "/mnt/c/Users/Markus/AppData/Roaming/Sublime Text/Packages/User" || return
    git add -u
    git commit -m "pushed with daily script"
    git push
    echo "Push of Sublime Text successfull."


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
else
    echo "Unknown system."
fi

