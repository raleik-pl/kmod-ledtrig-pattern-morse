#!/bin/bash

# github.com/raleik-pl/kmod-ledtrig-pattern-morse

MORSE=$(cat)

DIT="${1:-75}"
PAUSE="${2:-5000}"

DOT="$DIT"
DASH="$(($DIT*3))"
SEPARATOR="$(($DIT*2))" # word separator = 7 dits (dit separator + letter separator + 2dits + letter separator) / letter separator = 3 dits (2 dits preceeded by dit separator)

PATTERN=""
for (( i=0; i<${#MORSE}; i++ )); do
  char="${MORSE:$i:1}"
  if [ "$char" == "." ]; then # dot = dit = 75ms
    PATTERN="${PATTERN}1 $DOT 0 $DIT "
  elif [ "$char" == "-" ]; then # dash = 3 dits
    PATTERN="${PATTERN}1 $DASH 0 $DIT "
  elif [ "$char" == "/" ]; then
    PATTERN="${PATTERN}0 $SEPARATOR "
  elif [ "$char" == " " ]; then # letter separator = 3 dits (2 dits preceeded by dit separator)
    PATTERN="${PATTERN}0 $SEPARATOR "
  fi
done

echo "${PATTERN}0 $PAUSE"
