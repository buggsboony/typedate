#!/bin/bash

sleep 0.3

dt=$(date "+%Y-%m-%d %H:%M:%S")

ydotool type -d 0.1 -H 0.3 "$dt"
