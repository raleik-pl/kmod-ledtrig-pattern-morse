#!/bin/bash

# github.com/raleik-pl/kmod-ledtrig-pattern-morse

declare -A MORSE
MORSE[0]='-----'
MORSE[1]='.----'
MORSE[2]='..---'
MORSE[3]='...--'
MORSE[4]='....-'
MORSE[5]='.....'
MORSE[6]='-....'
MORSE[7]='--...'
MORSE[8]='---..'
MORSE[9]='----.'
MORSE[A]='.-'
MORSE[B]='-...'
MORSE[C]='-.-.'
MORSE[D]='-..'
MORSE[E]='.'
MORSE[F]='..-.'
MORSE[G]='--.'
MORSE[H]='....'
MORSE[I]='..'
MORSE[J]='.---'
MORSE[K]='-.-'
MORSE[L]='.-..'
MORSE[M]='--'
MORSE[N]='-.'
MORSE[O]='---'
MORSE[P]='.--.'
MORSE[Q]='--.-'
MORSE[R]='.-.'
MORSE[S]='...'
MORSE[T]='-'
MORSE[U]='..-'
MORSE[V]='...-'
MORSE[W]='.--'
MORSE[X]='-..-'
MORSE[Y]='-.--'
MORSE[Z]='--..'

INPUT="$(cat)"

for (( i=0; i<${#INPUT}; i++ )); do
  c=${INPUT:$i:1}
  c=${c^}
  if [[ "$c" == " " ]]; then
    echo -n "/ "
  else
    echo -n "${MORSE[$c]} "
  fi
done
echo
