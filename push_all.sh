#!/bin/bash

system_info=$(uname -a)
repos_privat=("lanparty" "blog" "horizon-flow" "knovault" "godot/beastmaster" "godot/infiniteluckyelements" "godot/test" "projects" "test" "card-generator")

hostname=$(hostname | tr '[:lower:]' '[:upper:]')
hostname_to_check=$(echo "PAPIERKORP" | tr '[:lower:]' '[:upper:]')

echo "hostname: $hostname"
echo "hostname_to_check: $hostname_to_check"

echo "System: $system_info"

# Check if the system_info contains "MINGW64" to identify Windows
if [[ $system_info == *"MINGW64"* ]]; then
    echo "executing gitbash script.."
    printf "===============\n\n\n\n\n==============="


    if [[ $hostname  != "$hostname_to_check" ]]; then
        for repo in "${repos_privat[@]}"
        do
            echo "Pushing Private - $repo..."
            cd "C:/develop/privat/$repo" || return
            git add --all
            git commit -m "pushed with daily script"
            git push
            echo -e "Push of $repo successfull. \n \n"

            printf "===============\n\n\n\n\n==============="
        done


        echo "Pushing todo\`s.."
        cd "C:/develop/todo" || return
        git add --all
        git commit -m "pushed with daily script"
        git push
        echo "Push of todo\`s successfull."

        printf "===============\n\n\n\n\n==============="

    fi

    if [[ $hostname  == "$hostname_to_check" ]]; then

        for repo in "${repos_privat[@]}"
        do
            echo "Pushing Private - $repo..."
            cd "C:/develop/$repo" || return
            git add --all
            git commit -m "pushed with daily script"
            git push
            echo -e "Push of $repo successfull. \n \n"

            printf "===============\n\n\n\n\n==============="
        done
    fi


    echo "Pushing SublimeText"
    cd "C:/Users/Markus/AppData/Roaming/Sublime Text/Packages/User" || return
    git add --all
    git commit -m "pushed with daily script"
    git push

    printf "===============\n\n\n\n\n==============="
elif [[ $system_info == *"Linux"* ]]; then
    echo "executing wsl script.."
    printf "===============\n\n\n\n\n==============="

    if [[ $hostname  != "$hostname_to_check" ]]; then
        for repo in "${repos_privat[@]}"
        do
            echo "Pushing $repo..."
            cd "/mnt/c/develop/privat/$repo" || return
            git add --all
            git commit -m "pushed with daily script"
            git push
            echo -e "Push of $repo successfull. \n \n"

            printf "===============\n\n\n\n\n==============="
        done

        echo "Pushing todo\`s.."
        cd "/mnt/c/develop/todo" || return
        git add --all
        git commit -m "pushed with daily script"
        git push
        echo "Push of todo\`s successfull."

        printf "===============\n\n\n\n\n==============="

        echo "Pushing SublimeText"
        cd "/mnt/c/Users/Markus/AppData/Roaming/Sublime Text/Packages/User" || return
        git add --all
        git commit -m "pushed with daily script"
        git push

        printf "===============\n\n\n\n\n==============="

        echo "Pushing Dotfiles"
        /usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME" add -u
        /usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME" commit -m "pushed with daily script"
        /usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME" push
        echo "Push of dotfiles successfull."

        printf "===============\n\n\n\n\n==============="

        echo "Pushing Windows Dotfiles"
        /usr/bin/git --git-dir="/mnt/c/Users/Markus/.dotfiles" --work-tree="/mnt/c/Users/Markus" add -u
        /usr/bin/git --git-dir="/mnt/c/Users/Markus/.dotfiles" --work-tree="/mnt/c/Users/Markus" commit -m "pushed with daily script"
        /usr/bin/git --git-dir="/mnt/c/Users/Markus/.dotfiles" --work-tree="/mnt/c/Users/Markus" push
        echo "Push of windows dotfiles successfull."

        printf "===============\n\n\n\n\n==============="
    fi


    if [[ $hostname  == "$hostname_to_check" ]]; then
        for repo in "${repos_privat[@]}"
        do
            echo "Pushing $repo..."
            cd "/mnt/c/develop/$repo" || return
            git add --all
            git commit -m "pushed with daily script"
            git push
            echo -e "Push of $repo successfull. \n \n"

            printf "===============\n\n\n\n\n==============="
        done

        echo "Pushing SublimeText"
        cd "/mnt/c/Users/Markus/AppData/Roaming/Sublime Text/Packages/User" || return
        git add --all
        git commit -m "pushed with daily script"
        git push

        printf "===============\n\n\n\n\n==============="

        echo "Pushing Dotfiles"
        /usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME" add -u
        /usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME" commit -m "pushed with daily script"
        /usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME" push
        echo "Push of dotfiles successfull."

        printf "===============\n\n\n\n\n==============="

        echo "Pushing Windows Dotfiles"
        /usr/bin/git --git-dir="/mnt/c/Users/Markus/.dotfiles" --work-tree="/mnt/c/Users/Markus" add -u
        /usr/bin/git --git-dir="/mnt/c/Users/Markus/.dotfiles" --work-tree="/mnt/c/Users/Markus" commit -m "pushed with daily script"
        /usr/bin/git --git-dir="/mnt/c/Users/Markus/.dotfiles" --work-tree="/mnt/c/Users/Markus" push
        echo "Push of windows dotfiles successfull."

        printf "===============\n\n\n\n\n==============="
    fi
else
    echo "Unknown system."
fi

