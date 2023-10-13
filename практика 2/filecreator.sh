#!/bin/bash

name=vlad

last_number=$(ls -1 | grep -E "^$name[0-9]+$" | sed "s/$name//g" | sort -n | tail -n 1)

if [ -z "$last_number" ]; then
    last_number=1
else
    last_number=$((last_number + 1))
fi

create_files() {
    for ((i = 0; i < 25; i++)); do
        touch "$name$((last_number + i))"
    done
    echo "Створено 25 файлів: $name$last_number до $name$((last_number + 24))"
}

create_files
