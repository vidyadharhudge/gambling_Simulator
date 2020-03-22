#!/bin/bash -x  
echo  "Welcome to gambling simulator game"
stake=100
bet=1
total_Winning_amount=0
total_Loss_amount=0
day=0
while (( $day<20 ))
do
   while (( stake<150 && stake>50 ))
   do
       gambler=$((RANDOM%2))
       if [ $gambler -eq 0 ]
       then
            stake=$((stake+bet))
            total_Winning_amount=$((total_Winning_amount+bet))
       else
            stake=$((stake-bet))
            total_Loss_amount=$((total_loss_amount+1))
       fi
         
   done
   day+=1x
done
echo $stake
echo "total win is:$total_Winning_amount"
echo "total loss is:$total_Loss_amount"
