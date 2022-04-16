#!/usr/bin/env bash

# options passed to variable
languages=$(
    curl -s -X GET "https://libretranslate.com/languages" -H  "accept: application/json" \
        | jq -j '.[]|"\n", .name, " (",.code, ") "' \
        | tr [:upper:] [:lower:]
);

source_language=$(
    echo -e "$languages" \
        | grep "\S" \
        | rofi -dmenu -p "Choose source language" \
        | awk '{print $2" "}' \
        | sed -r 's/\(|\)//g' \
        | tr -d ' '
);

if ! command -v vipe; then
    text_input=$( echo "" | rofi -width 200 -dmenu -p "Enter Text > " );
else
    random_id=$(( 1+$RANDOM ));
    tmp_file="tmp-rofi-translate-$random_id";

    text_input=$(/usr/bin/env xterm -fa FiraCode -fs 10 -e "vipe >> $tmp_file ");
    text_input=$(cat $tmp_file);
    rm $tmp_file;
fi

target_language=$(
    echo -e "$languages" \
        | grep "\S" \
        | rofi -dmenu -p "Choose target language" \
        | awk '{print $2" "}' \
        | sed -r 's/\(|\)//g' \
        | tr -d ' '
);

translation=$(
    curl -s 'https://libretranslate.de/translate' \
    -H 'Content-Type: application/json' \
    -d "{\"q\":\"$text_input\",\"source\":\"$source_language\",\"target\":\"$target_language\"}" \
        | jq -r .translatedText
);

if [[ $translation != 'null' ]]; then
    echo -n $translation | xsel -ib;
# else
#     # error stuff here
fi
