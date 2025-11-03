#!/bin/bash

#everything in shell is considered as string
NUMBER1=100
NUMBER2=200

SUM=$(($NUMBER1+$NUMBER2))

echo "SUM is: ${SUM}"

#size=4, max Index=3

LEADERS=("Modi" "Putin" "Turco" "Trump")

echo "All leaders: ${LEADERS[@]}"
echo "First leader: ${LEADERS[0]}"
echo "First leader: ${LEADERS[10]}"