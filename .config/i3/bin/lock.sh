#!/bin/sh

BACKGROUND='#0f141a'
TEXT='#f6f6f6'
PRIMARY='#485251'
SECONDARY='#396c9e'

i3lock \
--color=$BACKGROUND          \
\
--insidever-color=$SECONDARY   \
--ringver-color=$SECONDARY     \
\
--insidewrong-color=$BACKGROUND   \
--ringwrong-color=$PRIMARY   \
\
--inside-color=$BACKGROUND        \
--ring-color=$PRIMARY        \
--line-color=$PRIMARY        \
--separator-color=$PRIMARY   \
\
--verif-color=$TEXT          \
--wrong-color=$TEXT          \
--time-color=$TEXT           \
--date-color=$TEXT           \
--layout-color=$TEXT         \
--keyhl-color=$SECONDARY     \
--bshl-color=$SECONDARY      \
\
--screen 1                   \
--clock                      \
--indicator                  \
--time-str="%H:%M:%S"        \
--date-str="%A, %Y-%m-%d"       \
--keylayout 1                \
--show-failed-attempts       \
