# kmod-ledtrig-pattern-morse
useful scripts to translate text-to-morse and then morse-to pattern that is used by kmod-ledtrig-pattern

it requires bash to work

echo some text and pipe it to `text-to-morse.sh`
```
# echo "wan ping failed" | ./text-to-morse.sh 
.-- .- -. / .--. .. -. --. / ..-. .- .. .-.. . -.
```

echo the morse code and pipe it to `morse-to-pattern.sh`
```
echo ".-- .- -. / .--. .. -. --. / ..-. .- .. .-.. . -.." | ./morse-to-pattern.sh 
1 75 0 75 1 225 0 75 1 225 0 75 0 150 1 75 0 75 1 225 0 75 0 150 1 225 0 75 1 75 0 75 0 150 0 150 0 150 1 75 0 75 1 225 0 75 1 225 0 75 1 75 0 75 0 150 1 75 0 75 1 75 0 75 0 150 1 225 0 75 1 75 0 75 0 150 1 225 0 75 1 225 0 75 1 75 0 75 0 150 0 150 0 150 1 75 0 75 1 75 0 75 1 225 0 75 1 75 0 75 0 150 1 75 0 75 1 225 0 75 0 150 1 75 0 75 1 75 0 75 0 150 1 75 0 75 1 225 0 75 1 75 0 75 1 75 0 75 0 150 1 75 0 75 0 150 1 225 0 75 1 75 0 75 1 75 0 75
```

or do it at once, and redirect to led pattern directly
```
# echo pattern > /sys/class/leds/mdio-bus:0f:amber:wan/trigger
# echo "wan ping failed" | ./text-to-morse.sh | ./morse-to-pattern.sh 75 5000 > /sys/class/leds/mdio-bus:0f:amber:wan/pattern
```
the `morse-to-pattern.sh` accepts two arguments
```
# ./morse-to-pattern.sh [DIT PAUSE]
```
- DIT is the lenght of morse code "time unit" in milliseconds
  - DOT is equal to DIT
  - DASH is 3*DIT
- PAUSE in milliseconds is added to the end of the message

[![morse-led](https://github.com/raleik-pl/kmod-ledtrig-pattern-morse/raw/refs/heads/main/morse-led.mp4)](https://github.com/raleik-pl/kmod-ledtrig-pattern-morse/raw/refs/heads/main/morse-led.mp4)
