#!/bin/bash

case "$1" in
    --date|-d)
        date
        ;;
    --logs|-l)
        count=100
        if [ "$2" ]; then
            count=$2
        fi
        for ((i=1; i<=count; i++)); do
            echo -e "log$i.txt\n$(basename "$0")\n$(date)" > "log$i.txt"
        done
        ;;
    --help|-h)
        echo "Dostępne opcje:"
        echo "--date, -d      Wyświetla dzisiejszą datę"
        echo "--logs, -l [n]  Tworzy n (domyślnie 100) plików logx.txt"
        ;;
    --init)
        repo_url="https://github.com/TwojeKonto/NazwaRepozytorium.git"
        git clone $repo_url
        export PATH=$PATH:$(pwd)/NazwaRepozytorium
        ;;
    --error|-e)
        count=100
        if [ "$2" ]; then
            count=$2
        fi
        for ((i=1; i<=count; i++)); do
            mkdir -p "error$i"
            echo -e "error$i.txt\n$(basename "$0")\n$(date)" > "error$i/error$i.txt"
        done
        ;;
    *)
        echo "Nieznana opcja. Użyj --help aby zobaczyć dostępne opcje."
        ;;
esac
