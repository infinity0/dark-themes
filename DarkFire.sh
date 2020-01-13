#!/bin/bash

test "$(basename "$PWD")" == "DarkFire" || exit 1

find . -name '*.png' \
  -execdir convert '{}' -channel rgba -separate -swap 0,2 -delete 1 -duplicate 1,1 -insert 1 -combine '{}.out' \;

find . -name '*.png' \
  -execdir mv '{}.out' '{}' \;

find . -type f '(' -name '*.css' -or -name '*.ini' -or -name '*rc' ')' \
  -execdir sed -i -E \
    -e 's/rgba\s*\(([0-9]+)([^0-9]+)([0-9]+)([^0-9]+)([0-9]+)([^0-9]+)([.0-9]+)\)/rgba(\5\2\1\4\1\6\7)/g' \
    -e 's/rgb\s*\(([0-9]+)([^0-9]+)([0-9]+)([^0-9]+)([0-9]+)\)/rgb(\5\2\1\4\1)/g' \
    -e 's/#([0-9A-Fa-f][0-9A-Fa-f])([0-9A-Fa-f][0-9A-Fa-f])([0-9A-Fa-f][0-9A-Fa-f])/#\3\1\1/g' \
    -e 's/\bblue\b/red/g' \
    '{}' \;

# extra tweaks unrelated to blue-red switching
find . -type f '(' -name '*.css' -or -name '*.ini' -or -name '*rc' ')' \
  -execdir sed -i -E \
    -e 's/#FE6E6E/#FEFEFE/ig' \
    '{}' \;
#    -e 's/@define-color theme_fg_color @theme_text_color/@define-color theme_fg_color #FE6E6E/g' \

# deprecation fixes
sed -i -E \
  -e '/-GtkEntry-inner-border/d' \
  -e '/-GtkEntry-progress-border/d' \
  gtk-3.20/*.css

find . -type f '(' -name '*.css' -or -name '*.xml' -or -name '*.theme' ')' \
  -execdir sed -i -E \
    -e 's/DarkCold/DarkFire/g' \
    '{}' \;
