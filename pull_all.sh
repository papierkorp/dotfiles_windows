#!/bin/bash

repos_work=("infrastructure" "leasone" "wiki")
repos_privat=("lanparty" "blog" "horizon-flow" "pewito" "godot/beastmaster" "godot/infiniteluckyelements" "godot/test" "projects" "test" "card-generator")
system_info=$(uname -a)
hostname=$(hostname | tr '[:lower:]' '[:upper:]')
hostname_to_check=$(echo "PAPIERKORP" | tr '[:lower:]' '[:upper:]')

echo "hostname: $hostname"
echo "hostname_to_check: $hostname_to_check"

echo "System: $system_info"
    
if [[ $system_info == *"MINGW64"* ]]; then
    echo "executing gitbash script.."

    printf "===============\n\n\n\n\n==============="

    if [[ $hostname  != "$hostname_to_check" ]]; then
        for repo in "${repos_work[@]}"
        do
            echo "Pulling Ops - $repo..."
            cd "C:/develop/gitlab/$repo" || return
            git pull

            printf "===============\n\n\n\n\n==============="
        done

        for repo in "${repos_privat[@]}"
        do
            echo "Pulling Private - $repo..."
            cd "C:/develop/privat/$repo" || return
            git pull

            printf "===============\n\n\n\n\n==============="
        done


        echo "Pulling todo\`s.."
        cd "C:/develop/todo" || return
        git pull

        printf "===============\n\n\n\n\n==============="
    fi


    if [[ $hostname  == "$hostname_to_check" ]]; then
        for repo in "${repos_privat[@]}"
        do
            echo "Pulling Private - $repo..."
            cd "C:/develop/$repo" || return
            git pull

            printf "===============\n\n\n\n\n==============="
        done
    fi

    echo "Pulling SublimeText"
    cd "C:/Users/Markus/OneDrive/Sublime/User" || return
    # cd "C:/Users/Markus/AppData/Roaming/Sublime Text/Packages/User" || return
    git pull

    printf "===============\n\n\n\n\n==============="


elif [[ $system_info == *"Linux"* ]]; then
    echo "executing wsl script.."

    printf "===============\n\n\n\n\n==============="

    if [[ $hostname  != "$hostname_to_check" ]]; then
        for repo in "${repos_work[@]}"
        do
            echo "Pulling $repo..."
            cd "/mnt/c/develop/gitlab/$repo" || return
            git pull

            printf "===============\n\n\n\n\n==============="
        done

        for repo in "${repos_privat[@]}"
        do
            echo "Pulling $repo..."
            cd "/mnt/c/develop/privat/$repo" || return
            git pull

            printf "===============\n\n\n\n\n==============="
        done

        echo "Pulling todo\`s.."
        cd "/mnt/c/develop/todo" || return
        git pull

    printf "===============\n\n\n\n\n==============="
    fi

    if [[ $hostname  == "$hostname_to_check" ]]; then
        for repo in "${repos_privat[@]}"
        do
            echo "Pulling $repo..."
            cd "/mnt/c/develop/$repo" || return
            git pull

            printf "===============\n\n\n\n\n==============="
        done
    fi

    echo "Pulling SublimeText"
    # cd "/mnt/c/Users/Markus/AppData/Roaming/Sublime Text/Packages/User" || return
    cd "/mnt/c/Users/Markus/OneDrive/Sublime/User" || return
    git pull

    printf "===============\n\n\n\n\n==============="

    echo "Pulling dotfiles..."
    /usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME" pull #pull dotfiles

    printf "===============\n\n\n\n\n==============="

    echo "Pulling Windows dotfiles..."
    /usr/bin/git --git-dir="/mnt/c/Users/Markus/.dotfiles" --work-tree="/mnt/c/Users/Markus" pull #pull windows dotfiles
else
    echo "Unknown system."
fi
