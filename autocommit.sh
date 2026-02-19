#!/bin/bash
cd /home/nicholas/Desktop/Uni || exit 

# Controllo di modifiche
if [[ -z $(git status -s) ]]; then
  echo "Nessuna modifica"
  exit 0
fi

# Faccio il commit
git add .
timestamp=$(date +"%d-%m-%Y %H:%M")
git commit -m "Backup automatico . $timestamp"
git push origin master
