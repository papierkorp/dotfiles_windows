#!/bin/bash

repos_work=("infrastructure" "leasone" "wiki")
repos_privat=("cheatsheet" "lanparty" "blog" "THM" "horizon-flow" "godot/beastmaster")
# repos_worklab=("infrastructure" "leasone" "Testrepo")
system_info=$(uname -a)

echo "System: $system_info"

if [[ $system_info == *"MINGW64"* ]]; then
    echo "executing gitbash script.."

    for repo in "${repos_work[@]}"
    do
        echo "Pulling Ops - $repo..."
        cd "C:/develop/space/$repo" || return
        git pull
    done

    # for repo in "${repos_worklab[@]}"
    # do
    #   echo "Pulling Lab - $repo..."
    #   cd "C:/develop/labspace/$repo"
    #   git pull
    # done



    for repo in "${repos_privat[@]}"
    do
        echo "Pulling Private - $repo..."
        cd "C:/develop/privat/$repo" || return
        git pull
    done

    for repo in "${repos_privat[@]}"
    do
        echo "Pulling Private - $repo..."
        cd "C:/develop/$repo" || return
        git pull
    done

    echo "Pulling SublimeText"
    cd "C:/Users/Markus/AppData/Roaming/Sublime Text/Packages/User" || return
    git pull

    echo "Pulling todo\`s.."
    cd "C:/develop/sirconic/todo" || return
    git pull

elif [[ $system_info == *"Linux"* ]]; then
    echo "executing wsl script.."

    for repo in "${repos_work[@]}"
    do
        echo "Pulling $repo..."
        cd "/mnt/c/develop/space/$repo" || return
        git pull
    done

    # for repo in "${repos_worklab[@]}"
    # do
    #   echo "Pulling $repo..."
    #   cd "/mnt/c/develop/labspace/$repo"
    #   git pull
    # done

    for repo in "${repos_privat[@]}"
    do
        echo "Pulling $repo..."
        cd "/mnt/c/develop/privat/$repo" || return
        git pull
    done

    for repo in "${repos_privat[@]}"
    do
        echo "Pulling $repo..."
        cd "/mnt/c/develop/$repo" || return
        git pull
    done

    echo "Pulling SublimeText"
    cd "/mnt/c/Users/Markus/AppData/Roaming/Sublime Text/Packages/User" || return
    git pull

    echo "Pulling todo\`s.."
    cd "/mnt/c/develop/sirconic/todo" || return
    git pull

    /usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME" pull #pull dotfiles
    /usr/bin/git --git-dir="/mnt/c/Users/Markus/.dotfiles" --work-tree="/mnt/c/Users/Markus" pull #pull windows dotfiles
else
    echo "Unknown system."
fi
