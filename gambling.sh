#!/bin/bash 
echo  "Welcome to gambling simulator game"
stake=100
bet=1
gambler=$((RANDOM%2))
if [ $gambler -eq 0 ]
then
      stake=$((stake+1))
      echo "Win"
else
      stake=$((stake-1))
      echo "loss"
fi
echo $stake
