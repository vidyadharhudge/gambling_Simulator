#!/bin/bash   
echo  "Welcome to gambling simulator game"
BET=15

stake=100
Total_Winning_Amount=0
Total_Loss_Amount=0
Player=1

function LuckyDay()
{
     local MaxiMumLucky=$1
     for (( days=1; days<=20; days++ ))
     do
        if [[ ${TotalWinGamble[$days]} -gt $MaxiMumLucky ]]
        then
           MaxiMumLucky=${TotalWinGamble[$days]} 
           LuckyiestDay=$days
        fi
    done
    echo "max luckyiestday is:$LuckyiestDay"


}

function UnluckyDay()
{
      local MaxiMumUnLucky=$1
      for (( days=1; days<=20; days++ ))
      do
            if [[ ${TotalLostGamble[$days]} -gt $MaxiMumUnLucky ]]
            then
               MaxiMumUnLucky=${TotalLostGamble[$days]}
               UnLuckyiestDay=$days
            fi
     done
     echo "max Unluckiestday is:$UnLuckyiestDay"
}

while [[ $Player -eq 1 ]]
do
   for (( days=1; days<=20; days++ ))
   do
          TotalDayWin=0
          TotalDayLost=0
          stakeperday=100
      while (( stakeperday<150 && stakeperday>50 ))
      do
          gambler=$((RANDOM%2))
          if [ $gambler -eq 0 ]
          then
             stake=$((stake+BET))
             stakeperday=$((stakeperday+BET))
             Total_Winning_Amount=$((Total_Winning_Amount+BET))
             TotalDayWin=$((TotalDayWin+BET))
          else
             stake=$((stake-BET))
             stakeperday=$((stakeperday-BET))
             Total_Loss_Amount=$((Total_Loss_Amount+1))
             TotalDayLost=$((TotalDayLost+BET))
          fi
          done
             TotalWinGamble[$days]=$TotalDayWin
             TotalLostGamble[$days]=$TotalDayLost 
done
echo $stake
echo "total win is:$Total_Winning_Amount"
echo "total loss is:$Total_Loss_Amount"
echo "days:${!TotalWinGamble[@]} win:${TotalWinGamble[@]}"
echo "days:${!TotalLostGamble[@]} lost:${TotalLostGamble[@]}"
LuckDay=$( LuckyDay ${TotalWinGamble[1]} )
UnluckDay=$( UnluckyDay ${TotalLostGamble[1]} ) 
echo "$LuckDay"
echo "$UnluckDay"
read -p "enter the 1  to continue the gambling game" PlayAgain
Player=$PlayAgain
done
