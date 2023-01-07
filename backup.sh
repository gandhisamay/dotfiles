#!/bin/bash

export DISPLAY=:0

crontab -l > $HOME/dotfiles/crontabs

error_exit()
{
    notify-send -u critical "Backup Logs
Error while performing regular backup."
    exit 1
}

main(){
  CHANGES_NOT_STAGED="Changes not staged for commit"
  CHANGES_TO_COMMIT="Changes to be committed"
  GIT_STATUS=$(git status)

  if  grep -q "$CHANGES_NOT_STAGED" <<< "$GIT_STATUS"  ||  grep -q "$CHANGES_TO_COMMIT" <<< "$GIT_STATUS" ;then
    git add . 
    git commit -m "Regular backup" -m "$GIT_STATUS"
    git push || error_exit

    notify-send -u critical "Backup Logs
Regular backup successfully completed."
  fi
}

main
