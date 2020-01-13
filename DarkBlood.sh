#!/bin/bash

test "$(basename "$PWD")" == "DarkBlood" || exit 1

find . -name '*.png' \
  -execdir convert '{}' -channel rgba -separate -swap 0,1 -combine '{}.out' \;

find . -name '*.png' \
  -execdir mv '{}.out' '{}' \;

find . -type f '(' -name '*.css' -or -name '*.ini' -or -name '*rc' ')' \
  -execdir sed -i -E \
    -e 's/rgba\s*\(([0-9]+)([^0-9]+)([0-9]+)([^0-9]+)([0-9]+)([^0-9]+)([.0-9]+)\)/rgba(\3\2\1\4\5\6\7)/g' \
    -e 's/rgb\s*\(([0-9]+)([^0-9]+)([0-9]+)([^0-9]+)([0-9]+)\)/rgb(\3\2\1\4\5)/g' \
    -e 's/#([0-9A-Fa-f][0-9A-Fa-f])([0-9A-Fa-f][0-9A-Fa-f])([0-9A-Fa-f][0-9A-Fa-f])/#\2\1\3/g' \
    -e 's/\bgreen\b/red/g' \
    '{}' \;

# extra tweaks unrelated to green-red switching
find . -type f '(' -name '*.css' -or -name '*.ini' -or -name '*rc' ')' \
  -execdir sed -i -E \
    -e 's/#B9787E/#B9B9B9/ig' \
    '{}' \;
#    -e 's/@define-color theme_fg_color @theme_text_color/@define-color theme_fg_color #B9787E/g' \

# deprecation fixes
sed -i -E \
  -e '/-GtkEntry-inner-border/d' \
  -e '/-GtkEntry-progress-border/d' \
  gtk-3.20/*.css

find . -type f '(' -name '*.css' -or -name '*.xml' -or -name '*.theme' ')' \
  -execdir sed -i -E \
    -e 's/DarkMint/DarkBlood/g' \
    '{}' \;
