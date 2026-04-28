#!/bin/bash

# Vai nella cartella dello script (dove ci sono gli appunti)
cd "$(dirname "$0")"

# Aggiunge tutti i nuovi file o modifiche
git add .

# Crea il messaggio di commit con data e ora corrente
timestamp=$(date +"%Y-%m-%d %H:%M:%S")
git commit -m "Appunti Uni: Backup automatico del $timestamp"

# Carica su GitHub
# Sostituisci 'main' con il nome del tuo branch se diverso
git push origin main

echo "✅ Backup completato con successo alle $timestamp!"
