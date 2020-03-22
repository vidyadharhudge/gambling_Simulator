#!/bin/bash -x   
echo  "Welcome to gambling simulator game"
stake=100
bet=15
total_Winning_amount=0
total_Loss_amount=0

function luckyDay()
{
     local maximumLucky=$1
     for (( days=1; days<=20; days++ ))
     do
        if [[ ${Totalwingamble[$days]} -gt $maximumLucky ]]
        then
           maximumLucky=${Totalwingamble[$days]} 
           luckyiestday=$days
        fi
    done
    echo "max luckyiestday is:$luckyiestday"


}

function unluckyDay()
{
      local maximumUnlucky=$1
      for (( days=1; days<=20; days++ ))
      do
            if [[ ${Totallostgamble[$days]} -gt $maximumUnLucky ]]
            then
               maximumUnLucky=${Totallostgamble[$days]}
               Unluckyiestday=$days
            fi
      done
   echo "max Unluckiestday is:$Unluckyiestday"
}

for (( days=1; days<=20; days++ ))
do
        TotaldayWin=0
        TotaldayLost=0
        stakeperday=100
   while (( stakeperday<150 && stakeperday>50 ))
   do
        gambler=$((RANDOM%2))
        if [ $gambler -eq 0 ]
        then
             stake=$((stake+bet))
             stakeperday=$((stakeperday+bet))
             total_Winning_amount=$((total_Winning_amount+bet))
             TotaldayWin=$((TotaldayWin+bet))
        else
             stake=$((stake-bet))
             stakeperday=$((stakeperday-bet))
             total_Loss_amount=$((total_Loss_amount+1))
             TotaldayLost=$((TotaldayLost+bet))
        fi
        done
         Totalwingamble[$days]=$TotaldayWin
         Totallostgamble[$days]=$TotaldayLost 
done
echo $stake
echo "total win is:$total_Winning_amount"
echo "total loss is:$total_Loss_amount"
echo "days:${!Totalwingamble[@]} win:${Totalwingamble[@]}"
echo "days:${!Totallostgamble[@]} lost:${Totallostgamble[@]}"
luckDay=$( luckyDay ${Totalwingamble[1]} )
unluckDay=$( unluckyDay ${Totallostgamble[1]} ) 
echo "$luckDay"
echo "$unluckDay"
