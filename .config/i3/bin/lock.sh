#!/bin/sh

BACKGROUND='#26282a'
TEXT='#ffffff'
PRIMARY='#555555'
SECONDARY='#3979bc'

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
