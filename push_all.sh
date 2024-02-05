#!/bin/bash

system_info=$(uname -a)
repos_privat=("cheatsheet" "lanparty" "blog" "THM" "horizon-flow" "godot/beastmaster")

# Check if the system_info contains "MINGW64" to identify Windows
if [[ $system_info == *"MINGW64"* ]]; then
  echo "executing gitbash script.."

  for repo in "${repos_privat[@]}"
  do
    echo "Pushing Private - $repo..."
    cd "C:/develop/privat/$repo"
    git add .
    git commit -m "pushed with daily script"
    git push
    echo -e "Push of $repo successfull. \n \n"
  done

  echo "Pushing todo\`s.."
  cd "C:/develop/sirconic/todo"
  git add .
  git commit -m "pushed with daily script"
  git push
  echo "Push of todo\`s successfull."


  echo "Pushing SublimeText"
  cd "C:/Users/Markus/AppData/Roaming/Sublime Text/Packages/User"
  git add .
  git commit -m "pushed with daily script"
  git push
  echo "Push of Sublime Text successfull."

elif [[ $system_info == *"Linux"* ]]; then
  echo "executing wsl script.."

  for repo in "${repos_privat[@]}"
  do
    echo "Pushing $repo..."
    cd "/mnt/c/develop/privat/$repo"
    git add .
    git commit -m "pushed with daily script"
    git push
    echo -e "Push of $repo successfull. \n \n"
  done

  echo "Pushing todo\`s.."
  cd "/mnt/c/develop/sirconic/todo"
  git add .
  git commit -m "pushed with daily script"
  git push
  echo "Push of todo\`s successfull."


  echo "Pushing SublimeText"
  cd "/mnt/c/Users/Markus/AppData/Roaming/Sublime Text/Packages/User"
  git add .
  git commit -m "pushed with daily script"
  git push
  echo "Push of Sublime Text successfull."

else
  echo "Unknown system."
fi




