#!/bin/bash 
echo  "Welcome to gambling simulator game"
stake=100
bet=1

while (( stake<150 && stake>50 ))
do
     gambler=$((RANDOM%2))
     if [ $gambler -eq 0 ]
     then
          stake=$((stake+1))
     else
          stake=$((stake-1))
     fi
done
echo $stake
