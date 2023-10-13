#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Використання: $0 <директорія> <початкове розширення> <кінцеве розширення>"
    exit 1
fi

directory="$1"
original_extension="$2"
new_extension="$3"

for file in "$directory"/*."$original_extension"; do
    if [ -e "$file" ]; then
        filename=$(basename -- "$file")
        filename_noext="${filename%.*}"

        new_filename="$directory/$filename_noext.$new_extension"

        mv "$file" "$new_filename"

	echo "Перейменовую $filename на $(basename -- "$new_filename")"
    else
        echo "Файли з даним розширенням відсутні у вказаній директорії."
    fi
done
